# frozen_string_literal: true

require_relative '../../lib/low_type'

class Hashes
  include LowType

  def initialize(hash: Hash[String => String])
    hash
  end

  def typed_hash_arg(greetings = Hash[String => String])
    greetings
  end

  def typed_hash_kwarg(greetings: Hash[String => String])
    greetings
  end

  def typed_hash_arg_and_default_value(greetings = Hash[String => String] | { 'Hola' => 'Adios' })
    greetings
  end

  def typed_hash_kwarg_and_default_value(greetings: Hash[String => String] | { 'Hola' => 'Adios' })
    greetings
  end
end

class LowHashTrieNode
end

class LowHashAccessor
  include LowType
  using LowType::Syntax

  type_accessor nodes: Hash[String => LowHashTrieNode] | {}

  def initialize(nodes:)
    @nodes = nodes
  end
end
