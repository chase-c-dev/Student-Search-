import sqlite3
import tkinter as tk
from tkinter import messagebox, ttk
from tkinter import simpledialog
import Utility
class Enroll_Student:
    def __init__(self):
        self.entry_grade = None
        self.entry_StudentID = None
        self.entry_COURSEID = None
    
    def enroll(self, notebook):
        # Create the second tab for displaying all student names
        frame_enroll_student = ttk.Frame(notebook)
        notebook.add(frame_enroll_student, text="Enroll Student")

        # Create and place the labels and entries for the first and last names
        label_StudentID = tk.Label(frame_enroll_student, text="STUDENT ID:")
        label_StudentID.grid(row=0, column=0, padx=10, pady=10, sticky="e")
        self.entry_StudentID = tk.Entry(frame_enroll_student)
        self.entry_StudentID.grid(row=0, column=1, padx=10, pady=10, sticky="w")

        label_COURSEID = tk.Label(frame_enroll_student, text="COURSE ID:")
        label_COURSEID.grid(row=1, column=0, padx=10, pady=10, sticky="e")
        self.entry_COURSEID = tk.Entry(frame_enroll_student)
        self.entry_COURSEID.grid(row=1, column=1, padx=10, pady=10, sticky="w")

        label_GRADE = tk.Label(frame_enroll_student, text="GRADE:")
        label_GRADE.grid(row=2, column=0, padx=10, pady=10, sticky="e")
        self.entry_GRADE = tk.Entry(frame_enroll_student)
        self.entry_GRADE.grid(row=2, column=1, padx=10, pady=10, sticky="w")


        # Create and place the search button
        insert_button = tk.Button(frame_enroll_student, text="Enroll Student", command=lambda: Enroll_Student.add_student_to_enrollment(self, enroll_student_text))
        insert_button.grid(row=3, column=0, columnspan=2, padx=10, pady=10)

        # Create a frame for the Text widget and scrollbars
        frame_enroll_result = tk.Frame(frame_enroll_student)
        frame_enroll_result.grid(row=4, column=0, columnspan=2, padx=10, pady=10, sticky="nsew")

        # Configure the frame to make the Text widget resizable
        frame_enroll_student.grid_rowconfigure(4, weight=1)
        frame_enroll_student.grid_columnconfigure(1, weight=1)

        # Create the Text widget for displaying results
        enroll_student_text = tk.Text(frame_enroll_result, height=10, width=50, wrap="none")
        enroll_student_text.grid(row=0, column=0, sticky="nsew")

        # Configure the frame to make the Text widget resizable
        frame_enroll_result.grid_rowconfigure(0, weight=1)
        frame_enroll_result.grid_columnconfigure(0, weight=1)
        # Make the Text widget read-only initially
        enroll_student_text.config(state=tk.DISABLED)

        # Create the scrollbars and attach them to the Text widget
        scrollbar_vertical = tk.Scrollbar(frame_enroll_result, orient="vertical", command=enroll_student_text.yview)
        scrollbar_vertical.grid(row=0, column=1, sticky="ns")
        enroll_student_text.config(yscrollcommand=scrollbar_vertical.set)

        scrollbar_horizontal = tk.Scrollbar(frame_enroll_result, orient="horizontal", command=enroll_student_text.xview)
        scrollbar_horizontal.grid(row=1, column=0, sticky="ew")
        enroll_student_text.config(xscrollcommand=scrollbar_horizontal.set)
       
    
    def add_student_to_enrollment(self, result_text): 
        conn = sqlite3.connect('University.db') 
        cursor = conn.cursor() 
        student_id = self.entry_StudentID.get()
        #check if given id does not exist
        student_info = Utility.get_student_info_by_id(cursor, student_id)
        if not student_id:
            messagebox.showerror("Error", f"Please insert student id.")
            conn.close()
            return 
        if not student_info:
            result_text.config(state=tk.NORMAL)
            result_text.delete('1.0', tk.END)
            result_text.insert(tk.END, f"Student missing from the University Database! The student must first be added to the university datase first.")
            result_text.config(state=tk.DISABLED)
            #messagebox.showerror("Error", f"Student Missing from University Database, student must be added to the university datase first")
            student_id = Enroll_Student.add_student_to_university()
        #Get EnrollmentID
        enrollment_id = Utility.get_next_enrollment_id(cursor)
        enrollment_id = enrollment_id[0]
        
        #Get course ID
        course_id = self.entry_COURSEID.get()
        course_info = Utility.get_course_info_by_course_id(cursor, course_id)
        if not course_id:
            messagebox.showerror("Error", f"Please insert course id.")
            conn.close()
            return
        #check if given course id does not exist
        if not course_info:
            result_text.config(state=tk.NORMAL)
            result_text.delete('1.0', tk.END)
            result_text.insert(tk.END, f"Course could not be found please enter another Course ID.")
            result_text.config(state=tk.DISABLED)
            #messagebox.showerror("Error", f"Course could not be found please enter another Course ID.")
            conn.close()
            return
        #check if student is already enrolled in given course
        if Utility.is_student_enrolled(cursor, student_id, course_id):
            result_text.config(state=tk.NORMAL)
            result_text.delete('1.0', tk.END)
            result_text.insert(tk.END, f"Student is already enrolled in this course!")
            result_text.config(state=tk.DISABLED)
            #messagebox.showerror("Error", f"Student is already enrolled in this course!")
            conn.close()
            return
        
        #Get grade
        grade = self.entry_GRADE.get()
        #Check if given grade is in correct formate
        if not grade:
            messagebox.showerror("Error", f"Please insert a grade.")
            conn.close()
            return 
        if (not grade in ["N/A", "A-", "A", "A+", "B-", "B", "B+", "C-", "C", "C+","D-", "D", "D+", "F"]):
            result_text.config(state=tk.NORMAL)
            result_text.delete('1.0', tk.END)
            result_text.insert(tk.END, f"Given grade is not valid. Please choose from the following valid grades:\nN/A, A-, A, A+, B-, B, B+, C-, C, C+, D-, D, D+, F")
            result_text.config(state=tk.DISABLED)
            #messagebox.showerror("Error",f"Given grade is not valid. Please choose from the following valid grades:\nN/A, A-, A, A+, B-, B, B+, C-, C, C+, D- , D , D+, F")
            conn.close()
            return
        if student_info and course_id and grade:
            try: 
                Utility.insert_student_in_enrollment(enrollment_id, student_id, course_id, grade)
                result_text.config(state=tk.NORMAL)
                result_text.delete('1.0', tk.END)
                result_text.insert(tk.END, f"Student successfully enrolled in course.")
                result_text.config(state=tk.DISABLED)
            except sqlite3.Error as e:
                messagebox.showerror("Database Error", f"An error occurred: {e}")
        conn.close()
    
    def add_student_to_university():
        conn = sqlite3.connect('University.db')
        cursor = conn.cursor()
        student_id = Utility.get_next_student_id(cursor)
        student_id = student_id[0]
        conn.close()
        # Create the main Tkinter root window
        root = tk.Tk()
        root.withdraw()  # Hide the main window as we only need the popup
        # Get input for first name
        f_name = simpledialog.askstring("Input", "Enter First Name:")
        if f_name is None:  # User pressed Cancel
            return

        # Get input for last name
        l_name = simpledialog.askstring("Input", "Enter Last Name:")
        if l_name is None:  # User pressed Cancel
            return

        # Get input for age
        age = simpledialog.askinteger("Input", "Enter Age:")
        if age is None:  # User pressed Cancel
            return

        # Get input for major
        major = simpledialog.askstring("Input", "Enter Major:")
        if major is None:  # User pressed Cancel
            return
        
        try: 
            Utility.insert_student_in_university(student_id, f_name, l_name, age, major)
            messagebox.showinfo("Success", "Student successfully added to University.") 
            return student_id
        except sqlite3.Error as e:
            messagebox.showerror("Database Error", f"An error occurred: {e}")
    

        



