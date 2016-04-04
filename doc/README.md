### Telecoms
- Ruby version: 2.3.0

#### Gems

```
$ gem install rspec
$ gem install countries
$ gem install require_all
```

#### Tests

```
$ cd telecoms
$ cd spec
$ rspec *.rb
```

#### UML
![telecoms uml](https://raw.githubusercontent.com/adrianescat/telecoms/master/doc/telecoms_uml.png)

#### Decisions
- There are not validations for the simplicity of the solution 
- Calls has only two participants
- Ruby module instead of inheritance or composition.
