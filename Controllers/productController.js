import Product from '../Models/productModel'



//Afficher tous les produits
export async function getAll  (req, res) {
    res.send({ Products: await Product.find() })
  }
  
//Recuperer produit par id
export async function recupererParId  (req, res)  {
    res.send({ product: await Product.findById(req.body._id) })
  }








//Delete a product
export  async function deletee (req, res) {
    let product = await Product.findById(req.body._id)
    if (product) {
      await product.remove()
      return res.send({ message: "Product" + product._id + " has been deleted" })
    } else {
      return res.status(404).send({ message: "Product does not exist" })
    }
  }


  //Delete all products
  export async function deleteAll (req, res) {
    await Product.remove({})
    res.send({ message: "All products have been deleted" })
  }