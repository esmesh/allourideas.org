Factory.define :question do |q|
  q.name 'What is this?'
  q.url 'testurl'
  q.created_at Time.now.utc
  q.updated_at Time.now.utc
  q.tracking nil
  q.prompts_count 90
  q.choices_count 10
  q.appearance_id "f72da54add43e5ca39cab80f1c72f0e7"
  q.picked_prompt_id "1"
  q.it_should_autoactivate_ideas true
  q.user_ideas "0"
  q.user_votes "0"
  q.inactive_choices_count 2
  q.information nil
  q.votes_count 1030
  q.uses_catchup true
  q.creator_id 54059
  q.version 1
  q.item_count 1010
  q.show_results true
  q.local_identifier "335"
  q.active false
  q.site_id 9
  q.recent_votes 1
  q.user_ideas 20
  q.active_user_ideas 10
end

Factory.sequence :question_id do |n|
  n
end
