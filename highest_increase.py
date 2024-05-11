# the program finds the biggest increase (difference) in a sequence of integers provided in a file separated by new line.
# the algorithmic complexity of the program is Θ(n).

def max_increase(numbers):
    # initializes the first number as the 1st element of the list and the maximum increase as 0
    first_number = numbers[0]
    max_increase = 0
    
    # iterates through the numbers starting from the 2nd element
    for i in range(1, len(numbers)):
        # updates the first number if a smaller number is encountered
        if (first_number > numbers[i]):
            first_number = numbers[i]
            
        # updates the max increase if a larger difference is encountered
        elif (numbers[i] - first_number > max_increase):
            max_increase = numbers[i] - first_number
    
    # returns the max increase
    return max_increase
    
def main():
    # loops through the code until break statement is encountered
    while True:
        try:
            # gets user input for the file name
            filename = input("Enter the filename: ")
            
            # opens the file and reads integers from each line into a list
            with open(filename, 'r') as file:
                numbers = [int(line.strip()) for line in file]
            
            # calls the max increase function to find the biggest increase and prints the results
            result = max_increase(numbers)
            print("The biggest increase is:", result)
           
        # prints error message in case of misspelled file name 
        except FileNotFoundError:
            print("file not found. please enter a valid file name")
        
        # for convenience only
        # asks user if they want to continue
        choice = input("do you want to continue? (yes/no): ")
        
        # if the choice is not yes, break, exit the loop
        if choice != 'yes':
            break
            
# calls the main function to execute the program upon running the file 
main()

# for reference: https://www.geeksforgeeks.org/best-time-to-buy-and-sell-stock/
