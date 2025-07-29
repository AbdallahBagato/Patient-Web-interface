
# check master branche 
-------------------------------
# Patient Management System  

A simple **Flask-based web application** to manage patient records. The system allows users to **sign up** with their details and **search for patient records** using a National ID. Data is stored in a **SQLite database**.

---

## Features  

1. **Patient Signup**  
   - Users can register their details including name, email, National ID, and birthdate.  
   - Password validation ensures security, and data is checked for duplicates before being stored.  

2. **Patient Search**  
   - Search for patient records using their National ID.  
   - Displays user information including username, email, and National ID.  

3. **SQLite Database Integration**  
   - Patient data is stored in a lightweight SQLite database.  

4. **Form Validation**  
   - Form inputs are validated using `WTForms`, ensuring data integrity.  

---

## Technologies Used  

- **Python**  
- **Flask**  
- **Flask-WTF**  
- **SQLite**  
- **HTML**  

---

## Getting Started  

### Prerequisites  

- Python 3.8 or higher  
- `pip` (Python package manager)  

### Installation  

1. Clone the repository:  
   ```bash
   git clone https://github.com/yourusername/patient-management-system.git
   cd patient-management-system
   ```  

2. Install required dependencies:  
   ```bash
   pip install -r requirements.txt
   ```  

3. Run the application:  
   ```bash
   python app.py
   ```  

4. Access the application in your browser at:  
   ```plaintext
   http://127.0.0.1:8000
   ```  

---

## Project Structure  

```plaintext
patient-management-system/
│
├── app.py               # Main application file
├── signup.py            # FlaskForm classes for Signup and Search
├── templates/           # HTML templates for rendering
│   ├── main.html        # Main page
│   ├── signup.html      # Signup page
│   ├── search.html      # Search page
│   ├── out.html         # Output/results page
├── static/              # Static files (CSS, JS, images)
├── patient.db           # SQLite database file
├── requirements.txt     # Project dependencies
└── README.md            # Project documentation
```

---

## How It Works  

1. **Main Page**  
   Navigate to the homepage.  

2. **Signup**  
   Fill out the signup form with required details. On successful submission, the data is added to the database.  

3. **Search**  
   Enter a valid National ID to search for a patient. If found, the user details are displayed.  

4. **Validation**  
   - All fields are required.  
   - Password and confirm password must match.  
   - Duplicate National IDs are rejected.  

---

## Future Improvements  

- Add user authentication for secure login/logout.  
- Implement advanced search options.  
- Integrate a RESTful API for external access.  

---

## License  

This project is licensed under the MIT License.  
