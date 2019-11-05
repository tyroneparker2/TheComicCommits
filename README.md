# README

## Organization of This Repo

- The repo contains a base Rails web app project, developed in a manner consistent with [this Rails tutorial](https://memphis-cs.github.io/rails-tutorial-2019/). Thus, most of the files and folders are part of that project.
- A key exception is the `docs` folder, which contains the requirements and design artifacts required for the course. In particular, this folder should include the following:
  - `stories.md` - The [Markdown](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) file containing your team's up-to-date user stories.
  - `definitions.md` - The [Markdown](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) file containing your team's up-to-date definitions.
  - `video-m1.md` and `video-m2.md` - The [Markdown](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) files containing your team's video reports for Milestones M1 and M2, respectively.
  - A sitemap file that you will need to create.
  - Wireframe files that you will need to create (may go in a subfolder if separate files).
  - Model class diagram that you will need to create.

## Initializing the Web App

To initialize this project so that you can get started developing your web app, perform the following steps.

1. Boot up and log into your development VM, to `git clone` this repo, and to `cd` into the working directory of the project.

1. Install all the gems into the new gemset (named `project`) by running the following commands:

    ```bash
    gem install bundler
    bundle install
    ```

1. Download and install all the JavaScript dependencies for this Rails project by entering the following command:

    ```bash
    yarn install
    ```

1. Create the three PostgreSQL databases with the names specified in the `database.yml` file by running the following commands:

    ```bash
    sudo -i -u postgres psql -c "CREATE DATABASE project_development OWNER vagrant;"
    sudo -i -u postgres psql -c "CREATE DATABASE project_test OWNER vagrant;"
    sudo -i -u postgres psql -c "CREATE DATABASE project_production OWNER vagrant;"
    ```

1. Confirm the database configuration is correct by running the following commands:

    ```bash
    rails db:migrate
    rails db:reset
    ```

1. Confirm that the web app is working by running the following command:

    ```bash
    rails s -b 0.0.0.0
    ```

    Open <http://localhost:3000> in your web browser, and you should see the default "Yay! You’re on Rails!" page.

Once you have completed these steps, you should now be able to begin normal development tasks, like adding pages, models, etc. to the app.
