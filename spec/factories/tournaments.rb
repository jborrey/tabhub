FactoryGirl.define do
  factory :tournament do
    name 'Tournament A'
    start_date '2009-01-03 14:00:00'
    end_date '2009-01-06 14:00:00'
    location 'Some place far far away.'
    description 'Tournamnet description .....'
    debate_format 'BP'
    tournament_type 'Open'
    number_of_rounds 6
    owner_id 1
    institution_id 1
  end
end
