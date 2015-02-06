# Cuttings

Cuttings allows you to create seed data with a simple DSL that aims to shorten
your seeding code and keeping it readable.

Attachment seeding is made to work with Paperclip's way to assing files.

## Installation

Add to your Gemfile and `bundle install` :

```ruby
gem 'cuttings'
```

Then create the directory structure with the install generator :

```bash
rails generate cuttings:install
```

## Usage

Your can use **Cuttings** in your `db/seeds.rb` file, or inside `rake` tasks,
depending on which method you prefer.

If you choose the `db/seeds.rb` file way, just use the API as explained in the
**DSL** section.

If you choose the `rake` task way, a generator is provided to help you organize
your seed tasks.

### Using the `cuttings` generator :

But a generator is provided to help you create separated seed data accessible
with `rake` tasks.

```bash
rails generate cuttings users
```

Which will generate the following file in `lib/seeds/tasks/users.rake`

```ruby
namespace :seed do
  task users: :environment do
    Cuttings.plant do
      # Add your seeding code here
    end
  end
end
```

### Example usage

```ruby
namespace :seed do
  task users: :environment do
    Cuttings.plant do
      truncate %w(Visit)

      seed 'User' do
        create(
          name: 'Jean Jean',
          email: 'jean@jean.com',
          avatar: attachment('user.png')
        )
      end
    end
  end
end
```

## DSL

The DSL is quite simple, and gives you just the tools you need to get a
clean and readable seed file.

### Emptying models

To empty model tables, you can use the `#truncate` method followed by a list
of model names.

This is used to empty tables from models you won't seed, and is equivalent to
calling `.destroy_all` on all provided models.

```ruby
Cuttings.plant do
  truncate %w(Visit)
end
```

### Seeding models

To seed a model, you'll use the `#seed` method.
The `#seed` method automatically truncates the table of the model.
If you don't want it to do so, you can pass `truncate: false` as the second
argument.

```ruby
seed 'User', truncate: false do
  ...
end
```

To create your model's instances, you'll have to call `#create` inside the
`#seed` method block, and give it a hash of attributes to assign.

```ruby
seed 'Product' do
  create(name: 'Rope', price: 12.90)
end
```

### Seeding attachments

To seed attachments, start by adding your attachment to your
`lib/seeds/attachments` folder.
You'll then be able to use the `#attachment` helper method from inside
the `#seed` method block to pass it to your model's creation.

```ruby
seed 'User' do
  create(
    name: 'Jean Jean',
    email: 'jean@jean.com',
    avatar: attachment('user.png')
  )
end
```


## Licence

This project rocks and uses MIT-LICENSE.
