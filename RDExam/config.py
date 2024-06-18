import os

class Config:
    SECRET_KEY = os.getenv('SECRET_KEY') or 'you_will_never_guess'
    SQLALCHEMY_DATABASE_URI = 'mysql+mysqlconnector://std_2407_exam:Duba13579@std-mysql.ist.mospolytech.ru/std_2407_exam'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    UPLOAD_FOLDER = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static/images')
