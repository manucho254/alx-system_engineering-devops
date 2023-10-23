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
import csv
import json
import requests
import sys


def get_data(url: str) -> dict:
    """ request data from api
        Args:
             url: url to query
    """
    request = requests.get(url)

    return request.json()


def export_to_csv(user: dict, tasks: list) -> None:
    """ create and add data to csv file
        Args:
             tasks: a list of done tasks
    """
    user_id = user.get("id")
    name = user.get("username")
    file_name = "{}.csv".format(user_id)

    with open(file_name, "a") as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL, quotechar='"')
        for task in tasks:
            status = task.get("completed")  # completest status
            title = task.get("title")  # task title
            tmp = [user_id, name, status, title]
            writer.writerow(tmp)


def json_dump(data: dict) -> None:
    """ create and add data to json file
        Args:
            data: data to add to file
    """
    file_name = "todo_all_employees.json"

    with open(file_name, "w") as file:
        file.write(json.dumps(data))


if __name__ == "__main__":
    all_todos = {}

    url_1 = "https://jsonplaceholder.typicode.com/users"

    # get users
    users = get_data(url_1)

    for user in users:
        user_id = user.get("id")
        url_2 = "https://jsonplaceholder.typicode.com/user/{}/todos"\
                .format(user_id)
        user_todos = get_data(url_2)
        tasks = []

        for task in user_todos:
            tmp = {}
            tmp["username"] = user.get("username")
            tmp["task"] = task.get("title")
            tmp["completed"] = task.get("completed")
            tasks.append(tmp)

        all_todos[f"{user_id}"] = tasks

    # export data to json file
    json_dump(all_todos)
