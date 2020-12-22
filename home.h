#include <errno.h>
#include <substrate.h>
#include <mach/mach.h>
#include <mach/mach_time.h>
#include "../home/include/IOKit/hid/IOHIDEventTypes.h"
#include "../home/include/IOKit/hidsystem/IOHIDUsageTables.h"

#ifdef __LP64__
typedef double IOHIDFloat;
#else
typedef float IOHIDFloat;
#endif

typedef uint32_t IOHIDDigitizerTransducerType;
typedef UInt32	IOOptionBits;
typedef uint32_t IOHIDEventField;

extern "C" {
    typedef uint32_t IOHIDEventOptionBits;
    typedef struct __IOHIDEvent *IOHIDEventRef;
    typedef struct CF_BRIDGED_TYPE(id) __IOHIDEventSystemClient * IOHIDEventSystemClientRef;
    IOHIDEventRef IOHIDEventCreateKeyboardEvent(
        CFAllocatorRef allocator,
        uint64_t time, uint16_t page, uint16_t usage,
        Boolean down, IOHIDEventOptionBits flags
    );

    IOHIDEventRef IOHIDEventCreateDigitizerEvent(CFAllocatorRef allocator, uint64_t timeStamp, IOHIDDigitizerTransducerType type, uint32_t index, uint32_t identity, uint32_t eventMask, uint32_t buttonMask, IOHIDFloat x, IOHIDFloat y, IOHIDFloat z, IOHIDFloat tipPressure, IOHIDFloat barrelPressure, Boolean range, Boolean touch, IOOptionBits options);
    IOHIDEventRef IOHIDEventCreateDigitizerFingerEvent(CFAllocatorRef allocator, uint64_t timeStamp, uint32_t index, uint32_t identity, uint32_t eventMask, IOHIDFloat x, IOHIDFloat y, IOHIDFloat z, IOHIDFloat tipPressure, IOHIDFloat twist, Boolean range, Boolean touch, IOOptionBits options);

    IOHIDEventSystemClientRef IOHIDEventSystemClientCreate(CFAllocatorRef allocator);

    void IOHIDEventAppendEvent(IOHIDEventRef parent, IOHIDEventRef child);
    void IOHIDEventSetIntegerValue(IOHIDEventRef event, IOHIDEventField field, int value);
    void IOHIDEventSetSenderID(IOHIDEventRef event, uint64_t sender);
    void IOHIDEventSystemClientDispatchEvent(IOHIDEventSystemClientRef client, IOHIDEventRef event);
    // void IOHIDEventSystemConnectionDispatchEvent(IOHIDEventSystemConnectionRef connection, IOHIDEventRef event);
}
static void SendHIDEvent(IOHIDEventRef event)
{
    static IOHIDEventSystemClientRef client_(NULL);
    if (client_ == NULL) {
        client_ = IOHIDEventSystemClientCreate(kCFAllocatorDefault);
	}
    IOHIDEventSetSenderID(event, 0x8000000817319372);
    IOHIDEventSystemClientDispatchEvent(client_, event);
    CFRelease(event);
}



