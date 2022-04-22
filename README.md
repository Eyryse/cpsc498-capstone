# capstone-project-s22

# Test the project

- Backend

Ensure that the python packages within the requirements.txt file are already installed. The command should run when using the shell script *runCapstoneServer.sh*, but there are some instances where it does not execute.

- Frontend

Ensure that the [flutter items](https://docs.flutter.dev/get-started/install) are installed. After this, use the shell script *runCapstoneView.sh*. Keep in mind that the database queries will not execute when in this state, even if the backend is running. This is due to the sessions of users being managed by cookies rather than tokens, and the cookies are only established for the link *127.0.0.1:8000* as that is the location of the web server.

# Build the project

- Backend

Clone the repository

> If the database is not present, use the command *python3 manage.py migrate --run-syncdb* when in the backend folder. This will create the database based on the models present.

Ensure that the *web* folder is present in the backend folder.

> If the *web* folder is not present, go to the frontend folder and use the command *flutter build web*. This will create the JavaScript for the backend to use. When the build is finished, go to the build folder and copy the folder named "web." This folder will need to be put into the backend folder. After this, go into the *web* folder and edit the *index.html* file to where line 17 is **<base href="/web/">**.

Now the backend can be tested.

- Frontend

Currently, there is nothing to build regarding the frontend specifically due native applications not being present.
