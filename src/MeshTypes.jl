
abstract type AbstractMesh end
abstract type AbstractDictList end

# allows symbol -> list access, i.e. bdry[:wall]
struct Index
  lookup::Dict{Symbol, Int}      # name => names array position
  names::Vector{Symbol}
end

struct DictList{T} <: AbstractDictList
  id::Vector{Vector{T}}
  idnames::Index
end

mutable struct Node
  x::Float64
  y::Float64
end

struct Element
  order::Int
  QuadRule::Symbol
  NodeList::Vector{Int}
end

# need to add boundaries in a smart way, later
struct ScalarMesh <: AbstractMesh
  xy::Vector{Node}
  cm::Vector{Element}
  bdry::DictList{Int}      # boundary indices
  order::Symbol
end

# need to add boundaries in a smart way, later
struct FluidMesh <: AbstractMesh
  xy::Vector{Node}
  cm::Vector{Element}
  bdry::DictList{Int}      # boundary indices
  order::Symbol
  xyp::Vector{Node}                    # List of Node values
  cmp::Vector{Element}                 # connectivity matrix for pressure
end

# constructor for Index
function Index(names::Vector{Symbol})
  lookup = Dict{Symbol, Int}(zip(names, 1:length(names)))
  Index(lookup, names)
end

# constructor for Element
function Element(nl::Vector{Int})
  length(nl)==4 ? order=1 : order=2
  order == 1 ? QuadRule = :GaussOrder2 : QuadRule = :GaussOrder3

  return Element(order,QuadRule,nl)
end

# df[SingleColumnIndex] => AbstractDataVector
function Base.getindex(dl::AbstractDictList, col_ind::Symbol)
    selected_column = index(dl)[col_ind]
    return dl.id[selected_column]
end

function Base.getindex(mesh::AbstractMesh, col_ind::Symbol)
    return getindex(mesh.bdry,col_ind)
end

index(dl::AbstractDictList) = dl.idnames.lookup
indexlist(dl::AbstractDictList) = dl.idnames.names

##### Constructors for Meshes #####

# Assigns to appropriate mesh constructor based on mesh file extension
function Mesh(file_name::String)
  fileExtension = file_name[end-3:end]

  fn::GMSHfile = GMSHfile(file_name)
  mesh::ScalarMesh = Mesh(fn)
  return mesh
end

function FluidMesh(file_name::String)
  fileExtension = file_name[end-3:end]

  fn::GMSHfile = GMSHfile(file_name)
  mesh::FluidMesh = FluidMesh(fn)
  return mesh
end
