Class A.py
{
/// Load a pre-trained sentence transformer model. 
/// This model's output vectors are of size 384"
ClassMethod Embedd(sentences) As %String [ Language = python ]
{
  from sentence_transformers import SentenceTransformer as ST 
# vector =  DOUBLE,384
  model = ST('all-MiniLM-L6-v2')
  embeddings = model.encode(sentences)
#  // convert the embeddings to a string
  embeddings_list = [str(embedding.tolist()) for embedding in embeddings]
  return str(embeddings_list)
}

/// make a pure vector content for using TO_VECTOR()
ClassMethod Vec(txt) As %String [ SqlProc ]
{
 quit $tr(..Embedd(txt)," '[]")
}

}
