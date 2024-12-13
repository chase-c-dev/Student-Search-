import sqlite3
from tkinter import messagebox

def insert_student_in_enrollment(enrollment_id, student_id, course_id, grade): 
    conn = sqlite3.connect('University.db') 
    cursor = conn.cursor() 
    cursor.execute(""" INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (?, ?, ?, ?) """, (enrollment_id, student_id, course_id, grade)) 
    conn.commit() 
    conn.close()

def insert_student_in_university(student_id, f_name, l_name, age, major): 
    conn = sqlite3.connect('University.db') 
    cursor = conn.cursor() 
    cursor.execute("INSERT INTO Student (StudentId,  FirstName, LastName, Age, Major) VALUES (?, ?, ?, ?, ?) ", (student_id, f_name, l_name, age, major)) 
    conn.commit() 
    conn.close()
    
def update_student_grade(student_id, course_id, new_grade):
    conn = sqlite3.connect('University.db') 
    cursor = conn.cursor() 
    cursor.execute("UPDATE Enrollment SET grade = ? WHERE StudentId = ? AND CourseId = ?;", (new_grade, student_id, course_id)) 
    conn.commit() 
    conn.close()

def remove_student_from_course(student_id, course_id):
    try:
        conn = sqlite3.connect('University.db') 
        cursor = conn.cursor() 
        cursor.execute("DELETE FROM Enrollment WHERE StudentID = ? AND CourseID = ?;", (student_id, course_id))
        conn.commit()
        conn.close()
        
    except sqlite3.Error as e:
        messagebox.showerror("Error", f"{e}")

def remove_student_from_university(student_id):
    try:
        conn = sqlite3.connect('University.db') 
        cursor = conn.cursor() 
        cursor.execute("DELETE FROM Student WHERE StudentID = ?;", (student_id,))
        conn.commit()
        conn.close()
        messagebox.showinfo("Success", "Student successfully removed from the University.")
    except sqlite3.Error as e:
        messagebox.showerror("Error", f"{e}")
    

def get_student_info_by_name(cursor, first_name, last_name):
    cursor.execute("""
    SELECT Student.StudentId, Student.FirstName, Student.LastName, Student.Age, Student.Major, Course.CourseName, Enrollment.Grade, Professor.FirstName, Professor.LastName, Course.CourseId, Enrollment.EnrollmentId
    FROM Student
    LEFT JOIN Enrollment ON Student.StudentId = Enrollment.StudentId
    LEFT JOIN Course ON Enrollment.CourseId = Course.CourseId
    LEFT JOIN Professor ON Course.ProfessorId = Professor.ProfessorId
    WHERE Student.FirstName = ? AND Student.LastName = ?
    """, (first_name, last_name))
    return cursor.fetchall()

def get_student_info_by_name_v2(cursor, first_name, last_name):
    cursor.execute("""
    SELECT *
    FROM Student
    WHERE Student.FirstName = ? AND Student.LastName = ?
    """, (first_name, last_name))
    return cursor.fetchall()

def get_all_student_names(cursor):
    cursor.execute("SELECT StudentId, FirstName, LastName FROM Student")
    return cursor.fetchall()

def get_student_info_by_id(cursor, student_id):
    cursor.execute("""SELECT FirstName, LastName FROM Student where Student.StudentId = ?""", (student_id,))
    return cursor.fetchall()

def get_next_student_id(cursor):
    cursor.execute("SELECT MAX(StudentID) + 1 FROM Student;")
    return cursor.fetchone()

def get_next_enrollment_id(cursor):
    cursor.execute("SELECT MAX(EnrollmentID) + 1 FROM Enrollment;")
    return cursor.fetchone()

def get_course_info_by_course_id(cursor, course_id):
    cursor.execute("SELECT * FROM Course where Course.CourseId = ?", (course_id,))
    return cursor.fetchall()

def get_course_IDs_by_student_id(cursor,student_id):
    cursor.execute("SELECT CourseID FROM Enrollment WHERE StudentID = ?;", (student_id,))
    return cursor.fetchall()

def is_student_enrolled(cursor, student_id, course_id):
    cursor.execute( "SELECT COUNT(*) FROM Enrollment WHERE StudentID = ? AND CourseID = ?;", (student_id, course_id))
    result = cursor.fetchone()
    return result[0] > 0  # Returns True if count > 0, otherwise False
