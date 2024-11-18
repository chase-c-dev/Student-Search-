
# This code can add students and enrollments to the sql database

# import sqlite3

# def insert_student(cursor, student_id, first_name, last_name, age, major):
#     cursor.execute("""
#     INSERT INTO Student (StudentId, FirstName, LastName, Age, Major)
#     VALUES (?, ?, ?, ?, ?)
#     """, (student_id, first_name, last_name, age, major))

# def insert_enrollment(cursor, enrollment_id, student_id, course_id, grade):
#     cursor.execute("""
#     INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade)
#     VALUES (?, ?, ?, ?)
#     """, (enrollment_id, student_id, course_id, grade))

# # Connect to the SQLite database (creates 'university.db' if it doesn't exist)
# conn = sqlite3.connect('university.db')
# cursor = conn.cursor()

# # Example: Insert students
# students = [
#     (1, 'Chase', 'Simao', 21, 'Computer Science'),
#     (2, 'Kush', 'Patel', 21, 'Computer Science'),
#     (3, 'Robert', 'Robertson', 25, 'History'),
#     # Add more student tuples here
# ]

# for student in students:
#     insert_student(cursor, *student)

# # Example: Insert enrollments
# enrollments = [
#     (1, 1, 1, 'A'),
#     (2, 1, 2, 'B'),
#     (3, 1, 3, 'A'),
#     (4, 1, 26, 'B'),
#     (5, 2, 1, 'B'),
#     (6, 2, 2, 'A'),
#     (7, 2, 4, 'C'),
#     # Add more enrollment tuples here
# ]

# for enrollment in enrollments:
#     insert_enrollment(cursor, *enrollment)

# # Commit changes and close the connection
# conn.commit()
# conn.close()
