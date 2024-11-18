import sqlite3

def load_sql_file(cursor, sql_file_path):
    with open(sql_file_path, 'r') as sql_file:
        sql_script = sql_file.read()
    cursor.executescript(sql_script)

def get_student_info_by_id(cursor, student_id):
    cursor.execute("""
    SELECT Student.StudentId, Student.FirstName, Student.LastName, Student.Age, Student.Major, Course.CourseName, Enrollment.Grade
    FROM Student
    LEFT JOIN Enrollment ON Student.StudentId = Enrollment.StudentId
    LEFT JOIN Course ON Enrollment.CourseId = Course.CourseId
    WHERE Student.StudentId = ?
    """, (student_id,))
    return cursor.fetchall()

def get_student_info_by_name(cursor, first_name, last_name):
    cursor.execute("""
    SELECT Student.StudentId, Student.FirstName, Student.LastName, Student.Age, Student.Major, Course.CourseName, Enrollment.Grade
    FROM Student
    LEFT JOIN Enrollment ON Student.StudentId = Enrollment.StudentId
    LEFT JOIN Course ON Enrollment.CourseId = Course.CourseId
    WHERE Student.FirstName = ? AND Student.LastName = ?
    """, (first_name, last_name))
    return cursor.fetchall()

# Connect to the SQLite database (creates 'university.db' if it doesn't exist)
conn = sqlite3.connect('university.db')
cursor = conn.cursor()

# Load the SQL file
sql_file_path = 'Students.sql'
load_sql_file(cursor, sql_file_path)

# Interactive Prompt for User Input
while True:
    choice = input("Search by (1) Student ID or (2) Student Name? (Enter 1 or 2, or 'q' to quit): ").strip()
    
    if choice == '1':
        student_id = input("Enter Student ID: ").strip()
        if student_id.isdigit():
            student_info_by_id = get_student_info_by_id(cursor, int(student_id))
            print("\nInformation for Student ID:", student_id)
            for row in student_info_by_id:
                print(row)
        else:
            print("Invalid Student ID. Please enter a numeric value.")
    
    elif choice == '2':
        first_name = input("Enter First Name: ").strip()
        last_name = input("Enter Last Name: ").strip()
        student_info_by_name = get_student_info_by_name(cursor, first_name, last_name)
        print("\nInformation for Student:", first_name, last_name)
        for row in student_info_by_name:
            print(row)
    
    elif choice.lower() == 'q':
        break
    
    else:
        print("Invalid choice. Please enter 1 or 2, or 'q' to quit.")

# Commit changes and close the connection
conn.commit()
conn.close()

