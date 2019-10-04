// 默认编码 utf-8
// authorized by saltyzero@foxmail.com

#ifndef _OBJECTMAP_H
#define _OBJECTMAP_H

template<class Ty>
class ObjectMap
{
public:
	ObjectMap() {};
	static Ty* GetInstance();

_private:
	static Ty* m_instance;
};

template<class Ty> Ty* ObjectMap<Ty>::GetInstance()
{
	return m_instance;
}

template<class Ty> Ty* ObjectMap<Ty>::m_instance = nullptr;

#define DBClass struct
#define DB11(a) typedef UNORDERED_MAP<int32, a> DB11_##a; \
template<> DB11_##a* ObjectMap<DB11_##a>::m_instance = ObjectMap<DB11_##a>::m_instance == nullptr ? new DB11_##a() : ObjectMap<DB11_##a>::m_instance

#define DB1N(a) typedef UNORDERED_MAP<int32, std::vector<a>> DB1N_##a; \
template<> DB1N_##a* ObjectMap<DB1N_##a>::m_instance = ObjectMap<DB1N_##a>::m_instance == nullptr ? new DB1N_##a() : ObjectMap<DB1N_##a>::m_instance

#define DB1M(a) typedef std::multimap<int32, a> DB1M_##a; \
template<> DB1M_##a* ObjectMap<DB1M_##a>::m_instance = ObjectMap<DB1M_##a>::m_instance == nullptr ? new DB1M_##a() : ObjectMap<DB1M_##a>::m_instance

#define EX11(a) typedef UNORDERED_MAP<int32, a> DB11_##a; \
template<> _interface DB11_##a* ObjectMap<DB11_##a>::GetInstance()

#define EX1N(a) typedef UNORDERED_MAP<int32, std::vector<a>> DB1N_##a; \
template<> _interface DB1N_##a* ObjectMap<DB1N_##a>::GetInstance()

#define EX1M(a) typedef std::multimap<int32, a> DB1M_##a; \
template<> _interface DB1M_##a* ObjectMap<DB1M_##a>::GetInstance()

#define Table11(a) ObjectMap<DB11_##a>::GetInstance()
#define Table1N(a) ObjectMap<DB1N_##a>::GetInstance()
#define Table1M(a) ObjectMap<DB1M_##a>::GetInstance()

#define _const
#endif
