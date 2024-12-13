import sqlite3
import tkinter as tk
from tkinter import messagebox, ttk
from tkinter import simpledialog
import Utility

class Remove_Student:
    def __init__(self, notebook):
        self.frame_drop_student = ttk.Frame(notebook)
        notebook.add(self.frame_drop_student, text="Student Drop")

        # Dropdown options
        self.options = ["University", "Course"]

        # Create a StringVar to hold the selected value
        self.selected_value = tk.StringVar()

        # Create the Combobox widget to make a dropdown menu
        self.dropdown = ttk.Combobox(self.frame_drop_student, textvariable=self.selected_value)
        self.dropdown.focus_set()
        self.dropdown['values'] = self.options
        self.dropdown.set("Select an option")
        self.dropdown.pack(pady=10)

        # Initial frame 
        self.dropdown_frame = None

        # Bind the selection event
        self.dropdown.bind("<<ComboboxSelected>>", self.on_select)

    def on_select(self, event):
        # Destroy the existing frame if it exists
        if self.dropdown_frame:
            self.dropdown_frame.destroy()

        # Check the selected value
        s_value = self.selected_value.get()
        if s_value == "University":
            self.university_frame()
        else:
            self.course_frame()

    def university_frame(self):
        # Create a new frame for the University form
        self.dropdown_frame = tk.Frame(self.frame_drop_student)
        self.dropdown_frame.pack(pady=10)

        # Create and place the labels and entries for the form
        label_StudentID = tk.Label(self.dropdown_frame, text="STUDENT ID:")
        label_StudentID.grid(row=0, column=0, padx=10, pady=10, sticky="e")
        self.entry_U_StudentID = tk.Entry(self.dropdown_frame)
        self.entry_U_StudentID.grid(row=0, column=1, padx=10, pady=10, sticky="w")
        
         # Create and place the search button
        Remove_button = tk.Button(self.dropdown_frame, text="Drop University", command=self.Drop_Univeristy)
        Remove_button.grid(row=2, column=0, columnspan=2, padx=10, pady=10)
        
    def course_frame(self):
        # Create a new frame for the University form
        self.dropdown_frame = tk.Frame(self.frame_drop_student)
        self.dropdown_frame.pack(pady=10)

        # Create and place the labels and entries for the form
        label_StudentID = tk.Label(self.dropdown_frame, text="STUDENT ID:")
        label_StudentID.grid(row=0, column=0, padx=10, pady=10, sticky="e")
        self.entry_StudentID = tk.Entry(self.dropdown_frame)
        self.entry_StudentID.grid(row=0, column=1, padx=10, pady=10, sticky="w")
        
        label_COURSEID = tk.Label(self.dropdown_frame, text="COURSE ID:")
        label_COURSEID.grid(row=1, column=0, padx=10, pady=10, sticky="e")
        self.entry_COURSEID = tk.Entry(self.dropdown_frame)
        self.entry_COURSEID.grid(row=1, column=1, padx=10, pady=10, sticky="w")
        
        # Create and place the search button
        Remove_button = tk.Button(self.dropdown_frame, text="Drop Course", command=self.Drop_Course)
        Remove_button.grid(row=3, column=0, columnspan=2, padx=10, pady=10)
    
    def Drop_Course(self):
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
            messagebox.showerror("Error", f"Student missing from the University Database!")
            conn.close()
            return 
        #Get course ID
        course_id = self.entry_COURSEID.get()
        course_info = Utility.get_course_info_by_course_id(cursor, course_id)
        if not course_id:
            messagebox.showerror("Error", f"Please insert course id.")
            conn.close()
            return
        #check if given course id does not exist
        if not course_info:
            messagebox.showerror("Error", f"Course could not be found please enter another Course ID.")
            conn.close()
            return
        #check if student is already enrolled in given course
        if Utility.is_student_enrolled(cursor, student_id, course_id):
            Utility.remove_student_from_course(student_id,course_id)
            messagebox.showinfo("Success", "Student successfully removed from the course.")
            conn.close()
            return
        else:
            messagebox.showerror("Error", f"Student is already not enrolled in this course!")
            conn.close()
            return
        
    def Drop_Univeristy(self):
        conn = sqlite3.connect('University.db') 
        cursor = conn.cursor() 
        student_id = self.entry_U_StudentID.get()
        #check if given id does not exist
        student_info = Utility.get_student_info_by_id(cursor, student_id)
        if not student_id:
            messagebox.showerror("Error", f"Please insert student id.")
            conn.close()
            return 
        if not student_info:
            messagebox.showerror("Error", f"Student missing from the University Database!")
            conn.close()
            return 
        #Get all the courses the student is enrolled in
        list_of_courses = Utility.get_course_IDs_by_student_id(cursor, student_id)
        #Remove the student from all enrolled courses
        for course_tuple in list_of_courses:
            course_ID = course_tuple[0]
            Utility.remove_student_from_course(student_id, course_ID)
        #Remove student from university database
        Utility.remove_student_from_university(student_id)
        

        
        
            

    


    
        


    
    