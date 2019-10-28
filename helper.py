def mykeyword2(name):
     print("hello "+name)

mykeyword2("james")

def calculate_sum_list(max_i,max_j):
    sum = 0
    for i in range(1,max_i):
         for j in range(1,max_j):
              sum += i*j
    return sum