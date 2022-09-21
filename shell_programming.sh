#!/bin/bash

create()
{
   echo "Enter the address book name"
   read ab
   #check address book is available or not in current working directory
   res=`ls | grep $ab | wc -w`

   if [ $res -gt 0 ]
   then
	   echo "Error: file is already existing!"
   else
	   touch $ab
	   echo "Address book created!"
   fi
}

display()
{

   echo "Enter the address book name"
   read ab
   #check address book is available or not in current working directory
   res=`ls | grep $ab | wc -w`

   if [ $res -gt 0 ]
   then
           cat $ab
   else
           
           echo "File is not existing!"
   fi
}


insert()
{
   echo "Enter the address book name"
   read ab
   #check address book is available or not in current working directory
   res=`ls | grep $ab | wc -w`

   if [ $res -gt 0 ]
   then
           echo "enter Email"
	   read email

	   #check email is present in address book or not

	   len=`cat $ab | grep $email | wc -w`
	   if [ $len -gt 0 ]
	  then
		  echo "Error: Email already exists!"
         else
		  echo "Enter First Name, Last Name, Mobile Number"
		  read fname lname mobile

		  record=`echo $fname $lname $email $mobile`
		  echo $record >> $ab
		  echo "Record Inserted!"

         fi
    else
	    echo "File already exists!"
    fi
}    

modify()
{
   echo "Enter the address book name"
   read ab
   #check address book is available or not in current working directory
   res=`ls | grep $ab | wc -w`

   if [ $res -gt 0 ]
   then
           echo "enter Email"
           read email

           #check email is present in address book or not

           len=`cat $ab | grep $email | wc -w`
           if [ $len -gt 0 ]
          then
                 echo "Enter modified first name, last name and mobile number"
		 read fname lname mobile
		 new=`echo $fname $lname $email $mobile`
		 old=`cat $ab | grep $email`

		 echo "Old record: $old"
		 echo "New record: $new"

		 sed -i s/"$old"/"$new"/g $ab
		 echo "Record Modified!"
         else
                  echo "Error: Email doesn't exist"
                 

         fi
    else
            echo "Error: File already exists!"
    fi
}

delete()
{
   echo "Enter the address book name"
   read ab
   #check address book is available or not in current working directory
   res=`ls | grep $ab | wc -w`

   if [ $res -gt 0 ]
   then 
           echo "enter Email"
           read email

           #check email is present in address book or not

          len=`cat $ab | grep $email | wc -w`
           if [ $len -gt 0 ]
          then
                 
                 old=`cat $ab | grep $email`

                

                 sed -i s/"$old"//g $ab
		 sed -i /^$/d $ab
                 echo "Record Deleted!"
         else
                  echo "Error: Email doesn't exist"


         fi
    else
            echo "Error: File already exists!"
    fi
}







while [ true ]
do
	echo "***********MENU**********"
	echo "1. Create"
	echo "2. Display"
	echo "3. Insert Record"
	echo "4. Modify"
	echo "5.Delete"
	echo "7. Exit"

	echo "Enter Choice"
	read choice

	case $choice in
		1) create ;;
		2) display ;;
		3) insert ;;
		4) modify ;;
		5) delete ;;
		7) exit ;;
		*) echo "Wrong Choice!" ;;

	esac
done
