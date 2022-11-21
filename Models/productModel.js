import bodyParser from 'body-parser'
import mongoose from 'mongoose'
import express from 'express'

const app = express()
app.use(bodyParser.urlencoded({ extended: false}))
app.use(bodyParser.json())

const {Schema, model} = mongoose;
//creer votre schema qui decrit a quoi ressemblera chaque doc
const productSchema = new Schema(
    {
      
        prix: { 
            type: Number,
            required: true, },
        image: { 
                type: String,
                required: true, },
        
        etat: {type: Etat,
            enum: {
                values: ['Nouveau', 'Occasion'],
                message: '{VALUE} is not supported'
        } },

        marque: {
            type: String,
            required: true,},

        boutique: {
            type: String,
            required: true, },

        annee: {
            type: Date,
            required: true, },
        description: {
            type: String,
           required: false,
        },

        type: { 
            type: Type,
            enum: {
                values: ['tablette', 'camera', 'console', 'dsktop', 'mouse', 'audio', 'laptop', 'mobile', 'keyboard', 'smartwatch', 'tv', 'fridge'],
                message: '{VALUE} is not supported'
        }
         },

       
    },

    {
        timestamps: { currentTime: () => Date.now() },
    }
);

/**
 * creer notre model a partir du schema pour effectuer des actions CRUD sur nos doc et l'exporter
 */


export default model('Product', productSchema)