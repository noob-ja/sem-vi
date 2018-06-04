import re
def valid_password():
	instr = input('String:')
	if re.search('[A-Z]', instr) is not None and re.search(
	    '[a-z]', instr) is not None and re.search(
	        '[0-9]', instr) is not None and len(instr) >= 8:
		print('valid')
	else:
		print('invalid')

import random
greetings = ['hello','hi',"'s up",'hey hey hey','hey there','hey']
for x in input('Greetings: ').split():
  if x in greetings:
    print(random.choice(greetings))
  else:
    print('._.')