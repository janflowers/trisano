# Copyright (C) 2007, 2008, 2009, 2010, 2011 The Collaborative Software Foundation
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

class FormLinkRenderer < WillPaginate::LinkRenderer

  def prepare(collection, options, template)
    @form = options.delete(:form) || {}
    super
  end

  protected

  def page_link(page, text, attributes = {})
    @template.link_to_function text, "jQuery('##{@form}').append('<input type=hidden name=page value=#{page}/>'); jQuery('##{@form}').submit()"
  end
end