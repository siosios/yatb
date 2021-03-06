#ifndef __FPWHITELIST_H
#define __FPWHITELIST_H

#include "global.h"
#include "config.h"
#include "tools.h"

class FpEntry
{
	public:
	string fp;
	string comment;
	string user;
	vector<string> iplist; // store ip(s) of site
};

class CFpWhitelist
{
	public:
	
	CFpWhitelist();
	
	~CFpWhitelist();
	
	void Remove(string);
	
	int Insert(string);
	
	int IsInList(string);
	
	int ReadList(string,string);
	
	int WriteList(string,string);
	
	int CheckIp(string,string,string &);

	string GetComment(string);

	string GetList(void);
	
	private:
		
	vector<FpEntry> List;	
	
			
};

extern CFpWhitelist fpwhitelist;
extern string fpwl_bk,bk;

#endif

