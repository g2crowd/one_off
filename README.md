# OneOff
This gem allows you to run code that's needed for one time use. This can be deleting/editing specific records, moving 
data between old and new columns, and a variety of other uses.

## Usage
Generate a one_off:
```bash
$ rails/rake one_off g ${name of file}
```
It should be generated in the `db/one_off` directory. It'll look something like 
`20230508202324_one_off_name.rb`

This will give you a file where you can add code to the `#perform` method. 
```ruby
require 'one_off/environments'

module OneOff
  class OneOffName
    include Environments

    environments :development, :production

    def perform
      #add task into here
    end
  end
end
```
To run this one_off locally, use the matching task
```bash
$ rails/rake one_off:matching\[name_of_one_off\]
```
To have this run in production, you'll want to add this line to your build script. This will run all the one_offs that 
do not exist in the `one_off_tasks` database table. 
```bash
$ bundle exec rake db:migrate one_off:run
```
## Installation
Add this line to your application's Gemfile:

```ruby
gem 'one_off'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install one_off
```

This gem requires a database table to track the one_offs that have already been run. Run the generate migration:
```bash
$ rails/rake one_off:install:migrations
```
This will create a new migration file in your main app. You'll need to run migrations for this to take place:
```bash 
$ rails/rake db:migrate
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
