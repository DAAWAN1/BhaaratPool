const notFound=(req,res)=>{
   res.json({'message':'page not found','success':false}).status('404');
}

module.exports={notFound}