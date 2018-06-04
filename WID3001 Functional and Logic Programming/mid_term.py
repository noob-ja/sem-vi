#Q3
Age = {
    1: {
        'Name': 'Brian',
        'Age': 34
    },
    2: {
        'Name': 'Sze',
        'Age': 18
    },
    3: {
        'Name': 'JA',
        'Age': 22
    }
}

name = input('Name: ').lower()
age = list(x['Age'] for a,x in Age.items() if x['Name'].lower()==name)
age = age[0] if len(age)>0 else None
print(age)

#Q4
rev='Give me a string and I will display it backwards'
rev_str = lambda x: x.split()[::-1]
print(rev_str(rev))

#Q5
a = {2,5,6,8,9}
print([x for x in a if x%2==1])