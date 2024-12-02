#include<bits/stdc++.h>

using namespace std;


bool isIntVariable(string str){
	if(!((str[0] >= 'i' && str[0] <= 'n') || (str[0] >= 'I' && str[0] <= 'N'))){
		return false;
	}
	str = str.substr(1);
	for(int i=0; i<str.size(); i++){
		if(!(isalpha(str[i]) || isdigit(str[i]))){
			return false;
		}
	}

	return true;

}

bool isShortInt(string str){
	if(str.size() > 4  || str[0] == '0'){
		return false;
	}

	for(int i=0; i<str.size(); i++){
		if(!isdigit(str[i])){
			return false;
		}
	}

	return true;
}

bool isLongInt(string str){
	if(str.size() < 5 || str[0] == '0'){
		return false;
	}
	for(int i=0; i<str.size(); i++){
		if(!isdigit(str[i])){
			return false;
		}
	}
	return true;
}

bool isFloatVariable(string str){
	if(!((tolower(str[0]) >= 'a' && tolower(str[0]) <= 'h') || ((tolower(str[0]) >= 'o' && tolower(str[0]) <= 'z')))){
		return false;
	}
	str = str.substr(1);
	for(int i=0; i<str.size(); i++){
		if(!((isalpha(str[i]) || isdigit(str[i])))){
			return false;
		}
	}
	return true;
}

bool isFloatNumber(string str){
	int pos = str.find('.');
	if(pos < 1){
		return false;
	}
	string before = str.substr(0, pos);
	string after = str.substr(pos+1);
	if(before.size() != 1 && before[0] == '0'){
		return false;
	}
	if(after.size() != 2){
		return false;
	}
	for(int i=0; i<before.size(); i++){
		if(!isdigit(before[i])){
			return false;
		}
	}
	for(int i=0; i<after.size(); i++){
		if(!isdigit(after[i])){
			return false;
		}
	}

	return true;
}

bool isDoubleNumber(string str){
	int pos = str.find('.');
	if(pos < 1){
		return false;
	}
	string before = str.substr(0, pos);
	string after = str.substr(pos+1);
	if(before.size() != 1 && before[0] == '0'){
		return false;
	}
	if(after.size() < 3){
		return false;
	}
	for(int i=0; i<before.size(); i++){
		if(!isdigit(before[i])){
			return false;
		}
	}
	for(int i=0; i<after.size(); i++){
		if(!isdigit(after[i])){
			return false;
		}
	}

	return true;
}

bool isCharVariable(string str){
	if(str.substr(0, 3) != "ch_" || str.size() < 4){
		return false;
	}
	for(int i=3; i<str.size(); i++){
		if(!(isalpha(str[i]) || isdigit(str[i]))){
			return false;
		}
	}

	return true;
}

bool isBinaryVariable(string str){
	if(str.substr(0, 3) != "bn_" || str.size() < 4){
		return false;
	}
	for(int i=3; i<str.size(); i++){
		if(!(isalpha(str[i]) || isdigit(str[i]))){
			return false;
		}
	}

	return true;
}

bool isBinaryNumber(string str){
	if(str[0] != '0' || str.size() < 2){
		return false;
	}

	for(int i=1; i<str.size(); i++){
		if(!(str[i] == '0' || str[i] == '1')){
			return false;
		}
	}

	return true;
}

void shiftReducerParser(vector<string> &left, vector<string> &right){
	string input;
	cin>>input;

	string stck="";
	cout<<"Stack"<<"\t\t"<<"Input"<<"\t\t"<<"Actions"<<'\n';
	cout<<stck<<"\t\t"<<input<<"\t\t"<<"Shift"<<'\n';
	while(input.size()>0){
		stck.push_back(input[0]);
		input.erase(input.begin());
		cout<<stck<<"\t\t"<<input<<"\t\t";
		for(int i=0; i<right.size(); i++){
			int pos = stck.find(right[i]);
			if(pos >= 0){
				cout<<"Reduced using "<<left[i]<<" -> "<<right[i]<<'\n';
				stck.replace(pos, (right[i].size()), left[i]);
				cout<<stck<<"\t\t"<<input<<"\t\t";
				i=-1;
			}
		}
		cout<<"Shift\n";
	}
}

int precedence(char op){
	if(op == '+' || op == '-'){
		return 1;
	}
	else if(op == '*' || op == '/'){
		return 2;
	}
	else{
		return -1;
	}
}

string infixToPostfix(string infix){
	string postfix = "";
	stack<char> stck;
	for(int i=0; i<infix.size(); i++){
		if(isdigit(infix[i]) || isalpha(infix[i])){
			postfix += infix[i];
		}
		else{
			if(stck.size() == 0){
				stck.push(infix[i]);
			}
			else{
				char top = stck.top();
				if(precedence(infix[i]) > precedence(top)){
					stck.push(infix[i]);
				}
				else{
					stck.pop();
					stck.push(infix[i]);
					postfix += top;
				}
			}
		}
	}

	while(stck.size() > 0){
		postfix += stck.top();
		stck.pop();
	}

	return postfix;
}

struct Node{
	char op;
	Node* left;
	Node* right;
	Node(char val){
		this->op = val;
		this->left = NULL;
		this->right = NULL;
	}
};

Node* syntaxTree(string postfix){
	stack<Node*> stck;
	for(int i=0; i<postfix.size(); i++){
		if(isdigit(postfix[i]) || isalpha(postfix[i])){
			stck.push(new Node(postfix[i]));
		}
		else{
			Node* node = new Node(postfix[i]);
			Node* left = stck.top();
			stck.pop();
			Node* right = stck.top();
			stck.pop();
			node->left = left;
			node->right = right;
			stck.push(node);

		}
	}

	return stck.top();
}

void printSyntaxTree(Node* node, int level){
	if(node == NULL) return;
	printSyntaxTree(node->left, level + 1);
	while(level > 0){
		level--;
		cout<<"\t\t\t";
	}
	cout<<node->op<<"\n";
	printSyntaxTree(node->right, level + 1);
}


int main(){
	string expr;
	cin>>expr;
	string postfix = infixToPostfix(expr);
	cout<<postfix<<'\n';
	Node* node = syntaxTree(postfix);
	printSyntaxTree(node, 0);
}