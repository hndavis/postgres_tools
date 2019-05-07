// C++ program to convert X delimated file to Y delimated file
// Chaim Davis
// copywrite Refinativ  2019 april 19

#include <iostream>
#include <fstream>





using namespace std;
class StrUtils
{
  public: void FindReplace(string& line, string& oldString, string& newString) {
  const size_t oldSize = oldString.length();

  //do nothing if line is shorter than the string to find
  if( oldSize > line.length() ) return;
  
  const size_t newSize = newString.length();
  for( size_t pos = 0; ; pos += newSize ) {
  	//Locate the substring to replace
  	pos = line.find( oldString, pos );
  	if( pos == string::npos ) return;
  	if( oldSize == newSize ) {
  		// if they're same size, use std::string::replace
  		line.replace( pos, oldSize, newString );
  	} else {
  	// if not same size, replace by erasing and inserting
  		line.erase( pos, oldSize );
 		 line.insert( pos, newString );
  	}
  	}
  }
};


int main(int argc, char** argv)
{
	if ( argc < 2 )
	{
		cout << "USAGE: convert InputFile" << endl;
		return 1;
	}	
	string oldSub = "|";
	string newSub = "\t";
	string backSlashN = "\\N";
	string empty ="";
	
	//fstream file;
	try {
	//std::ifstream infile("/efs/estimatesdata/oof_0.txt");
	std::ifstream infile(argv[1]);
	StrUtils *strUtils = new StrUtils();
	for( std::string line; getline( infile, line); )
		{
		strUtils->FindReplace(line, oldSub, newSub);
		strUtils->FindReplace(line,backSlashN,empty);
		std::cout << line << endl;
		}
	delete strUtils;
	}
	catch( const std::exception& ex )
	{
		std::cerr << "exception caught:" << ex.what() << endl;
	}
	catch ( const std::string& ex)
	{
		cerr << "exception caught" << ex << endl;
	}
	catch(...)
	{
		cerr << "exception caught" << endl;
	}
return 0;

}




