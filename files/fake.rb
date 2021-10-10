class Object

  platform = ENV['RUBY_PLATFORM'] or raise 'Set RUBY_PLATFORM'
  version = ENV['RUBY_VERSION']

  begin
    load "~/.fakerc"
  rescue LoadError
  end

  remove_const :RUBY_PLATFORM
  RUBY_PLATFORM = platform

  if defined? PLATFORM
    remove_const :PLATFORM
    PLATFORM = platform
  end

  if version
    remove_const :RUBY_VERSION
    RUBY_VERSION = version

    if defined? VERSION
      remove_const :VERSION
      VERSION = version
    end
  end

  CROSS_COMPILING = true

end
