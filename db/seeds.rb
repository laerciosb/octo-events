# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

webhook = Webhook.find_or_create_by!(integration: :github)
issue = Issue.find_or_create_by!(number: 1)
Event.find_or_create_by!(triggerable: issue, webhook:, action: 'push')
