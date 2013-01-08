# Copyright (C) 2007, 2008, 2009, 2010, 2011, 2012, 2013 The Collaborative Software Foundation
#
# This file is part of TriSano.
#
# TriSano is free software: you can redistribute it and/or modify it under the
# terms of the GNU Affero General Public License as published by the
# Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.
#
# TriSano is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with TriSano. If not, see http://www.gnu.org/licenses/agpl-3.0.txt.
require File.dirname(__FILE__) + '/../../../spec_helper'
require 'trisano/cucumber/profile_loader'

include Trisano::Cucumber

describe ProfileLoader do

  before :all do
    @default_cuke_yml = File.join(RAILS_ROOT, 'lib', 'trisano', 'cucumber', 'cucumber.yml')
  end

  it "should load profiles from anywhere we tell it to" do
    loader = ProfileLoader.new(@default_cuke_yml)
    loader.has_profile?('standard').should be_true
  end

  it "should provide access to loaded profiles" do
    loader = ProfileLoader.new(@default_cuke_yml)
    loader.profiles.map{|k,v| k }.sort.should == ['any_standard', 'enhanced', 'standard']
  end

end

