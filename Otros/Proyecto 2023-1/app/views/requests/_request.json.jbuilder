# frozen_string_literal: true

json.extract! request, :id, :field, :created_at, :updated_at
json.url request_url(request, format: :json)
