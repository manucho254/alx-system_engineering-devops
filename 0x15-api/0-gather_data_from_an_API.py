#!/usr/bin/python3
""" Script that, using this https://jsonplaceholder.typicode.com/,
    for a given employee ID,
    returns information about his/her TODO list progress.

    The script must display on the standard output
    the employee TODO list progress in this exact format:

    First line: Employee EMPLOYEE_NAME is done with
    tasks(NUMBER_OF_DONE_TASKS/TOTAL_NUMBER_OF_TASKS):

    EMPLOYEE_NAME: name of the employee
    NUMBER_OF_DONE_TASKS: number of completed tasks

    TOTAL_NUMBER_OF_TASKS: total number of tasks,
    which is the sum of completed and non-completed tasks

    Second and N next lines display the title of completed tasks:
    TASK_TITLE (with 1 tabulation and 1 space before the TASK_TITLE)

"""
import requests
import sys


def get_data(url: str) -> dict:
    """ request data from api
        Args:
             url: url to query
    """
    request = requests.get(url)

    return request.json()


if __name__ == "__main__":
    employee_id = int(sys.argv[1])

    number_of_tasks = 0
    number_of_done_tasks = 0
    done_tasks = []

    url_1 = "https://jsonplaceholder.typicode.com/users/{}".format(employee_id)
    url_2 = "https://jsonplaceholder.typicode.com/user/{}/todos"\
            .format(employee_id)

    # get data from api
    user = get_data(url_1)
    todos = get_data(url_2)

    number_of_tasks = len(todos)

    # get number of done tasks

    for task in todos:
        if task.get("completed"):
            done_tasks.append(task)
            number_of_done_tasks += 1

    print("Employee {} is done with tasks({}/{}):".format(
                                                          user.get("name"),
                                                          number_of_done_tasks,
                                                          number_of_tasks))

    for task in done_tasks:
        print(" \t{}".format(task.get("title")))
