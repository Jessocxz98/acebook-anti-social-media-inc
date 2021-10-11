# AceBook --> Anti-social Media Inc
Jessica, Sophie, Tomisin, Gianluca, Mabon, David and Paul!

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:

```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```

Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again

### MVP User stories
```
As a user
So I can have my details saved
I can sign up to Acebook

As a user
So I can access my Acebook session
I can log in to Acebook

As a user
So I can get out of my Acebook session
I can log out of Acebook

As a user
So I can navigate the website easily
I can see and use a nav bar at the top of the page

As a user
So I can see what has been posted
Posts appear with the newest post first
```

## MVP Database Domain Modelling
Below we have modelled our databases and methods for the MVP.

![Database domain Modelling](https://github.com/Jessocxz98/acebook-anti-social-media-inc/blob/main/app/assets/images/MVP/image.png)

![Database domain Modelling](https://github.com/Jessocxz98/acebook-anti-social-media-inc/blob/main/app/assets/images/MVP/image%20(1).png)

## Wireframes
![Wireframes](https://github.com/Jessocxz98/acebook-anti-social-media-inc/blob/main/app/assets/images/MVP/Wireframes.png)
