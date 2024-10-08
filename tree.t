template <typename BaseData>
void tree<BaseData>:: add(BaseData item){
    if(root==nullptr){
        root = new Node<BaseData>;
        root->Left = nullptr;
        root->Right = nullptr;
        root->Data = item;
        return;
    }
    Node<BaseData>* Temp = root;
    while(true){
        
        if (Temp->Left != nullptr && item<Temp->Data){
            Temp = Temp->Left;
         }
        else if(Temp->Left==nullptr && item<Temp->Data ){
            Temp->Left = new Node<BaseData>;
            Temp->Left->Data= item;
            break;
        } 
        else if (Temp->Right != nullptr && item>=Temp->Data){
            Temp = Temp->Right;
         }
        else{
            Temp->Right = new Node<BaseData>;
            Temp->Right->Data= item;
            break;
        } 
    } 
    

    
}

template <typename BaseData>
void tree<BaseData>:: inOrder(){
    inOrderHelp(root);
}
template <typename BaseData>
void tree<BaseData>:: inOrderHelp(Node<BaseData>* item){
    
    if(item){
        inOrderHelp(item->Left);
        std::cout<<item->Data<<std::endl;
        inOrderHelp(item->Right);
    }

}


// //accessing all data 
// template <typename BaseData>
// void tree<BaseData>::print(){
 
//     Node<BaseData>* Temp = root;cle
//  while(Temp || !NodeParent.empty()){

        
// //         //inOrder Traversal - left, root , right;
    
//     if(!root){
//         std::cout<<"empty tree";
//     }
//     else{
//         do{
//             while(Temp->Left){
//             NodeParent.push(Temp);
//             Temp = Temp->Left;
//             }

//             std::cout<<"Data is:"<<Temp->Data<<std::endl;

            
//             if(!Temp->Left && !Temp->Right){
//                 NodeParent.pop();
//                 Temp = NodeParent.top();
//             }
//             if (Temp->Right)
//             {
//             NodeParent.push(Temp);
//             Temp = Temp -> Right;
//             }
            
            
//         }
//         while (!NodeParent.empty());
//     }
 

//   }
//  }        
//     //        // print parent
    //       //go parent->right->leftmost
    //       //if right leftmost exist - print leftmost->data
   // }






//         // if(Temp->Left){
//         //     std::cout<<Temp->Data;
//         //     Temp = Temp->Left;
//         // }
//         // else{
//         //     Temp = Temp->Right;
//         //     std::cout<<root->Right->Data;
//         // }
            
        
//   }
 //}
template <typename BaseData>
void tree<BaseData>::searchAndRemove(BaseData r_target){
    Node<BaseData>** current = &root;

    if(!root){
        return;
    }
    else{
         std::cout<<"Root: "<<root->Data<<std::endl;
           while(true){
                if(r_target == (*current)->Data){
                    remove(*current);
                    return;
                }
                if(r_target<(*current)->Data && (*current)->Left){
                    current = &((*current)->Left);
                }
                else if(r_target>(*current)->Data && (*current)->Right){
                    current = &((*current)->Right);
                }
                
                else{
                    std::cout<<"Not Found"<<std::endl;
                    return;
                }
            }
       
    }
}
template <typename BaseData>
void tree<BaseData>::remove(Node<BaseData>*& r_target) {
    if (!(r_target->Left && r_target->Right)){
        delete r_target;
        r_target = nullptr;
    }
    else if(!r_target->Right){
        
        *r_target = *r_target->Left;
        delete r_target->Left;
        r_target->Left = nullptr;
    }
    
    else {
        Node<BaseData>* Temp = r_target->Right;
        Node<BaseData>* Temp2 = r_target->Left;
        while(Temp->Left)
            Temp = Temp->Left;

        *r_target = *Temp;
        
        
       
        Temp = nullptr;
        r_target->Left = Temp2;

        Temp2= nullptr;
    }
}