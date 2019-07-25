require 'sqlite3'
require 'singleton'



class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
    
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL

    User.new(user.first)
  end

  def self.find_by_name(name)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)

    SELECT
      *
    FROM
      users
    WHERE
      fname = ?
    AND
      lname = ?
  SQL
    User.new(user)
  end

  def initialize(info)
    @id = info['id']
    @fname = info['fname']
    @lname = info['lname']
  end
end

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
    SQL

    Question.new(question.first)
  end

  
  def initialize(info)
    @id = info['id']
    @title = info['title']
    @body = info['body']
    @author_id = info['author_id']
  end
end

