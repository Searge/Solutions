from pyspark import SparkConf, SparkContext
from pyspark.mllib.feature import HashingTF
from pyspark.mllib.feature import IDF

# Boilerplate Spark stuff:
conf = SparkConf().setMaster("local").setAppName("SparkTFIDF")
sc = SparkContext(conf=conf)

# Load documents (one per line).
rawData = sc.textFile(
    "/Users/searge/Code/Solutions/Skillshare/DataScience/exercise/subset-small.tsv")
fields = rawData.map(lambda x: x.split("\t"))
documents = fields.map(lambda x: x[3].split(" "))

# Store the document names for later:
documentNames = fields.map(lambda x: x[1])

# Now hash the words in each document to their term frequencies:
hashingTF = HashingTF(100000)  # 100K hash buckets just to save some memory
tf = hashingTF.transform(documents)

# At this point we have an RDD of sparse vectors representing each document,
# where each value maps to the term frequency of each unique hash value.

# Let's compute the TF*IDF of each term in each document:
tf.cache()
idf = IDF(minDocFreq=2).fit(tf)
tfidf = idf.transform(tf)

# Now we have an RDD of sparse vectors, where each value is the TFxIDF
# of each unique hash value for each document.

# I happen to know that the article for "Abraham Lincoln" is in our data
# set, so let's search for "Gettysburg" (Lincoln gave a famous speech there):

# First, let's figure out what hash value "Gettysburg" maps to by finding the
# index a sparse vector from HashingTF gives us back:
gettysburgTF = hashingTF.transform(["Gettysburg"])
gettysburgHashValue = int(gettysburgTF.indices[0])

# Now we will extract the TF*IDF score for Gettsyburg's hash value into
# a new RDD for each document:
gettysburgRelevance = tfidf.map(lambda x: x[gettysburgHashValue])

# We'll zip in the document names so we can see which is which:
zippedResults = gettysburgRelevance.zip(documentNames)

# And, print the document with the maximum TF*IDF value:
print("Best document for Gettysburg is:")
print(zippedResults.max())

"""
Stands for Term Frequency and Inverse Document Frequency
• Term Frequency just measures how often a word occurs in a document
    ▫ A word that occurs frequently is probably important to that document’s meaning
• Document Frequency is how often a word occurs in an entire set of documents, i.e., all of Wikipedia or every web page
    ▫ This tells us about common words that just appear everywhere no matter what the topic, like “a”, “the”, “and”, etc.
• So a measure of the relevancy of a word to a document might be:

                            𝑇𝑒𝑟𝑚 𝐹𝑟𝑒𝑞𝑢𝑒𝑛𝑐𝑦
                        -------------------
                          𝐷𝑜𝑐𝑢𝑚𝑒𝑛𝑡 𝐹𝑟𝑒𝑞𝑢𝑒𝑛𝑐𝑦

Or: Term Frequency * Inverse Document Frequency
That is, take how often the word appears in a document, over how often it just appears everywhere. That gives you a measure of how important and unique this word is for this document

• We actually use the log of the IDF, since word frequencies are distributed exponentially. That gives us a better weighting of a words overall popularity
• TF-IDF assumes a document is just a “bag of words”
    ▫ Parsing documents into a bag of words can be most of the work
    ▫ Words can be represented as a hash value (number) for efficiency
    ▫ What about synonyms? Various tenses? Abbreviations? Capitalizations? Misspellings?
• Doing this at scale is the hard part
    ▫ That’s where Spark comes in!

• A very simple search algorithm could be:
    ▫ Compute TF-IDF for every word in a corpus
    ▫ For a given search word, sort the documents by their TF-IDF score for that word
    ▫ Display the results
"""
