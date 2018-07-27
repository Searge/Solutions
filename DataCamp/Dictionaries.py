# Definition of countries and capital
countries = ['spain', 'france', 'germany', 'norway']
capitals = ['madrid', 'paris', 'berlin', 'oslo']

# From string in countries and capitals, create dictionary europe
'''
How do I combine two lists into a dictionary in Python?
https://stackoverflow.com/questions/7271385/how-do-i-combine-two-lists-into-a-dictionary-in-python
https://docs.python.org/3/library/itertools.html#itertools.izip
'''
europe = dict(zip(countries, capitals))

# Print europe
print(europe)

'''
{'france': 'paris', 'norway': 'oslo', 'germany': 'berlin', 'spain': 'madrid'}
'''

# Print out the keys in europe
print(europe.keys())
'''
dict_keys(['spain', 'norway', 'germany', 'france'])
'''

# Print out value that belongs to key 'norway'
print(europe['norway'])

# Add italy to europe
europe['italy'] = 'rome'

# Print out italy in europe
print('italy' in europe)

# Add poland to europe
europe['poland'] = 'warsaw'

# Print europe
print(europe)

'''
True
{'poland': 'warsaw', 'france': 'paris', 'germany': 'berlin', 'spain': 'madrid', 'norway': 'oslo', 'italy': 'rome'}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Somebody thought it would be funny to mess with your accurately generated dictionary.
'''

# Definition of dictionary
europe = {'spain': 'madrid', 'france': 'paris', 'germany': 'bonn',
          'norway': 'oslo', 'italy': 'rome', 'poland': 'warsaw',
          'australia': 'vienna'}

# Update capital of germany
europe['germany'] = 'berlin'

# Remove australia
del(europe['australia'])

# Print europe
print(europe)

'''
{'poland': 'warsaw', 'france': 'paris', 'germany': 'berlin', 'spain': 'madrid', 'norway': 'oslo', 'italy': 'rome'}

#################
Dictionariception

Dictionaries can contain key:value pairs where the values are again dictionaries.

As an example, have a look at the script where another version of europe - the dictionary you've been working with all along - is coded. The keys are still the country names, but the values are dictionaries that contain more information than just the capital.

It's perfectly possible to chain square brackets to select elements. To fetch the population for Spain from europe, for example, you need:

europe['spain']['population']
'''

# Dictionary of dictionaries
europe = {'spain': {'capital': 'madrid', 'population': 46.77},
          'france': {'capital': 'paris', 'population': 66.03},
          'germany': {'capital': 'berlin', 'population': 80.62},
          'norway': {'capital': 'oslo', 'population': 5.084}}


# Print out the capital of France
print(europe['france']['capital'])

# Create sub-dictionary data
data = {'capital': 'rome', 'population': 59.83}

# Add data to europe under key 'italy'
europe['italy'] = data

# Print europe
print(europe)
