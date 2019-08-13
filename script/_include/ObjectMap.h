// 默认编码 utf-8
// authorized by saltyzero@foxmail.com

#ifndef _OBJECTMAP_H
#define _OBJECTMAP_H

template<class Ty>
class ObjectMap
{
private:
	ObjectMap() {};
	static Ty* m_instance;
public:
    static Ty* GetInstance();
};

template<class Ty> Ty* ObjectMap<Ty>::m_instance = nullptr;

template<class Ty> Ty* ObjectMap<Ty>::GetInstance()
{
    return m_instance == nullptr ? m_instance = new Ty() : m_instance;
}

#define DBClass struct
#define DB11(a) typedef UNORDERED_MAP<int32, a> DB11_##a
#define DB1N(a) typedef UNORDERED_MAP<int32, std::vector<a>> DB1N_##a
#define DBMN(a) typedef std::multimap<int32, a> DBMN_##a
#define Table(a) ObjectMap<a>::GetInstance()
#define _const
#endif
