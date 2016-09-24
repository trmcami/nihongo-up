class Difficulty < ActiveHash::Base
  self.data = [
    { id: 1, name: 'beginner', friendly_name: 'Beginner'},
    { id: 2, name: 'low_intermediate', friendly_name: 'Low Intermediate'},
    { id: 3, name: 'high_intermediate', friendly_name: 'High Intermediate'},
    { id: 4, name: 'advanced', friendly_name: 'Advanced'}
  ]
end
