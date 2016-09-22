require 'pry'
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  sorted_emoticons = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each do |name, symbols|
  	sorted_emoticons["get_meaning"][symbols[1]] = name
  	sorted_emoticons["get_emoticon"][symbols[0]] = symbols[1]
  end
  return sorted_emoticons
end

def get_japanese_emoticon(file_path, emoticon)
	japanese_emoticon = load_library(file_path)["get_emoticon"][emoticon]
	japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
	english_meaning = load_library(file_path)["get_meaning"][emoticon]
	english_meaning ? english_meaning : "Sorry, that emoticon was not found"
end
