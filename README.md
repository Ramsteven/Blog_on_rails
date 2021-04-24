## Alpha Blog
This is a blog that use a login and registration system, for creation of articles  with CRUD functions, that allow see and post articles inside of app handling the data persistence using Relational database, also doing resizing avatars images saving in a Cloud, When the user didn't choose an avatar the systems assing that automaticly using API and the styles of the page are handled bootstrap 4.

<a align="center" href="https://enigmatic-sands-44491.herokuapp.com/"><img align="center" src="https://i.ibb.co/h8dZCYC/alpha1.png" alt="alpha1" border="0" ></a>

    Ruby on Rails 6.1.3, 
    ruby 3.0.0, 
    PostgreSQL database manager, 
    S3 bucket how Storage system,
    API https://avatars.dicebear.com/docs for generate avatars dinamically.
    Styles: https://bootswatch.com/

install ruby and ruby on rails with this guide => https://guides.rubyonrails.org/getting_started.html

## Installation
Follow these easy steps to install and start the app:
        
Clone folder and go to the folder:
    
    git clone git@github.com:Ramsteven/alpha-blog.git

    cd alpha-blog
    
Intall all libraries (e.i rezing avatars) or gem necesary for the blog run the command:
        
    bundle install    

Inside of folder now with need rung the migrations for create the db and tables, then tun:

    rails db:migrate

Now with need all styles for the blog then, Install bootstrap jquerry and popper user the bellow commnad, if you dont have yarn [install here ](https://classic.yarnpkg.com/en/docs/install/#debian-stable), 

    yarn add bootstrap jquery popper.js
    

Now for un the app local run:

    rails server

Go to browser and type localhost:3000 and hit enter and welcome to alphablog.
