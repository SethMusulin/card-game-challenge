# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Deal.delete_all

File.foreach("lib/seeds/poker.txt").with_index do |line, line_num|
  begin
    deal = Deal.create(player_1: line[0, 14].chomp, player_2: line[15, 29].chomp)

    deal.determine_winner
    pp "creating hand #{line_num}"
  rescue
    pp "Error Creating line number #{line_num}"
  end
end