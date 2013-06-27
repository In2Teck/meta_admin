#!/usr/bin/env ruby

require './project'
require './tables'

Dir["*.dsl"].each {|file| load file }
