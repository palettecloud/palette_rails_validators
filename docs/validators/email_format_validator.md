# EmailFormatValidator

## Usage

```ruby
class User < ActiveRecord::Base
  attribute :email
  validates :email, email_format: true
end
```

## Strict Option

validate email with strict format. see following regex.

```
/\A([\w+\-]+\.)*[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
```

### Example

```ruby
validates :email, email_format: true, strict: true
```
