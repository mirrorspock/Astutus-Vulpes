Feature: Writing blog posts
  As an aspiring author
  I want to publish my blog posts
  So I can become rich and famous    
  
  Scenario: Creating a new post     
    Given I am logged in as "frodo@kabisa.nl"
    And I write a new blog post titled "Hello, world!"     
    And I go to the home page     
    Then I should see "Hello, world!"
  
  Scenario: Removing a post
    Given a blog post titled "Hello, world!"
    When I remove the post "Hello, world!"
    And I go to the home page
    Then I should not see "Hello, world!"
