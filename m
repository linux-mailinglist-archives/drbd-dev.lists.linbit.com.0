Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0204AC794C
	for <lists+drbd-dev@lfdr.de>; Thu, 29 May 2025 09:00:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F124C160956;
	Thu, 29 May 2025 08:59:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 36532160956
	for <drbd-dev@lists.linbit.com>; Thu, 29 May 2025 08:59:48 +0200 (CEST)
Received: by mail-wr1-f50.google.com with SMTP id
	ffacd0b85a97d-3a4ee391e6fso69767f8f.3
	for <drbd-dev@lists.linbit.com>; Wed, 28 May 2025 23:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1748501988; x=1749106788; darn=lists.linbit.com;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:to:subject:user-agent:mime-version:date:message-id:from
	:to:cc:subject:date:message-id:reply-to;
	bh=U3vDomSaZKSaXl3IOVGjRkX3fMJ6cqEw99VVO1ohuNE=;
	b=bWSukj6iKJ8cK9vl6O/RIDZI4VArZabwW6NSW/UbSkStHbYw3iuactifajTLNXj6zS
	dVjj2OCQ9Esrw+8EkjG0UIbanmDztbht6cHDLFSxnET48eRvC4ZKB2nxeql/dQz8Q+Qb
	wQNT6b+XoXS+xzxm61r8DVArqE6nDxLRFUXJRMem0EFXZDjoaBs6bWKL5jEIsHy4kqHz
	kX/eBLjEkHhso8os454I+L/RBaIlvxQZ8XQliL/7O+QArNcxk22SFTIYSeuHJn/v3X27
	cwVtOiFdniQcFSmuKZeXcc/7lbxwcB83jo/tQn5/yJ022JUl39rEAeYhBIszVATxIKsJ
	oj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1748501988; x=1749106788;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=U3vDomSaZKSaXl3IOVGjRkX3fMJ6cqEw99VVO1ohuNE=;
	b=sFAAuILpC/0sbgrVbk/Dp3vXsSJJRB2kNVfh8XkhvldKSfShIbC2fom+t1Llb8os2R
	vAf2nsHfHoOf04X+hcOdI5OTqTGk7gKaJCPbcNqrvkqdPI2+CPA2nM4Up97YPFO2VQnF
	S9VD5yxmKMbyowGHMCbW/A/DLdobLLuLX89AYqwpI1s2BMf4tyD2XTFgSdsOoh1i5LAd
	mibPA1+KJxEMdWrIKkuUz7SU7I8TIMF8ecYOVrdQ0WcByBkIARp5c+UUdetNT+jmbQI1
	rRbOeOtqTLX40MoFgjK+eV8Vu/CljLB/gAJ5wLeHnMo2nRwqr/ywv8j7aZ7HszFXuGmc
	0K5A==
X-Gm-Message-State: AOJu0YzWx5PDwfMkdjUSCJdFNyuJ0eyJse6Odkv6RMCcy8gPfA2wQy9f
	jAJXzYM3QqdfgUsLY6fGpucRK/hYqk80aV5SkW59xv1n0k7YXDFjBTA8hx3z7pwrCadbghnj/cQ
	1Chi4
X-Gm-Gg: ASbGnctubIWM2aAa4KhTs+mnm9iTctX6tnABYVPq40OzVC2gJkTlT/kJAeMyLXcGVLb
	pV+MG3vqmjX79typELvBxqFLNCWJV8GKVoJ21/zPGfYX6ahjXX9ZEuBwJlVZCwhGFYSLXyhPFSb
	gLx1WLtEKoCOKVVgd2oK651Q+mls7Vi78VFzWFjmIK3rq/wUTYuLxWt02mOi1QHHMnDwifZIEJE
	2XA7JT4uvjnyYAyyBqTgPwFLVHkS+GS8psrBrV2wq2vXDwo1LQ/QEU/W40jPKkjcccieP0b1f5W
	edbZfI4iIQfR7nWoLcDR5GtinscwEQJg5Zl9A9NMqCLuwN2ckbiLE2VS
X-Google-Smtp-Source: AGHT+IG6TbIQRLRi6BcQWKaV1tnvf01rmgZ/CF6KqM5aKBGgLMxBtg6LK5yndgoPelXTkXpK70xpmw==
X-Received: by 2002:a05:6000:2204:b0:3a4:eb9c:7cbc with SMTP id
	ffacd0b85a97d-3a4eb9c7f68mr1426345f8f.15.1748501987961; 
	Wed, 28 May 2025 23:59:47 -0700 (PDT)
Received: from [10.202.32.28] ([202.127.77.110])
	by smtp.gmail.com with ESMTPSA id
	98e67ed59e1d1-3121b91b51asm724865a91.22.2025.05.28.23.59.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 28 May 2025 23:59:47 -0700 (PDT)
Message-ID: <6f471202-c821-4d73-ac3c-96b07f605cf1@suse.com>
Date: Thu, 29 May 2025 14:59:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remove lock file after using it
To: drbd-dev@lists.linbit.com, roland.kammerer@linbit.com
References: <20250515024817.25717-1-heming.zhao@suse.com>
	<20250515024817.25717-3-heming.zhao@suse.com> <aDbFRcFQpEbhG9E1@arm64>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <aDbFRcFQpEbhG9E1@arm64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hello,

On 5/28/25 16:11, Roland Kammerer wrote:
> On Thu, May 15, 2025 at 10:48:15AM +0800, Heming Zhao wrote:
>> In a SELinux env, if a user runs as root to set up a DRBD device,
>> it will leave a lock file in "/var/run/drbd/lock/". Then HA pacemaker
>> will fail to set up DRBD because of a permission issue.
> 
> Sorry, but that needs more explanation. I wonder why it works for
> everybody else including our SuSE customers but would require changes
> for you? What exactly (sles versions, pacemaker versions,...) do I need
> to reproduce this?

Sorry for the late reply, I took some time to set up a reproducible env
for this issue.

This issue was originally reported by the SUSE QA team, and occurs in
SLE16 (which is not yet released). However, I also reproduced it on the
latest openSUSE tumbleweed.

please refer to the final section of this mail for the reproduction steps.

> 
>>   /* ignore errors */
>> -void dt_unlock_drbd(int lock_fd)
>> +void dt_unlock_drbd(int lock_fd, int minor)
>>   {
>> +	int ret;
>> +	char *lfname;
>> +
>>   	if (lock_fd >= 0)
>>   		unlock_fd(lock_fd);
>> +
>> +	lfname = get_lock_filename(minor, 0);
>> +	ret = unlink(lfname);
>> +	free(lfname);
>> +	if (ret < 0) {
>> +		perror("unlink");
>> +	}
>>   }
> 
> As I don't understand why you would need these changes in the first
> place I did not look into the patch too closely, but: You first unlock
> and then unlink? Shouldn't that be the other way round? As is you would
> create a race I guess. But first things first: why do you need that at
> all?

I am not quit following you. From your description, it appears that
drbd-utils expects the lock file (/var/run/drbd/lock/xxx) to persist
throughout the system's runtime.
If drbd-utils deletes the file after every close() call, this could
potentially trigger a race condition in DRBD, correct?

This patch removes the lock file after close(). From the code logic
perspective, the lock file can be safely removed after close().
Could you point out a potential race condition?

> 
> Regards, rck
> 
> P.S.: it is fine to send user land patches here, but the main focus is
> on kernel level coordination, feel free to send patches via github.

OK, I will submit the next patch via github.


---- following are the reproducible steps -----

## setup vm

create two VMs:
- 4 VCPU, 4G mem, one 100M *shared* disk for sbd, one 1G disk for drbd.
- the sbd is using scsi bus type, drbd disk is using virtio bus type

## install softwares

I use opensuse tumbleweed latest ISO:
> openSUSE-Tumbleweed-DVD-x86_64-Snapshot20250522-Media.iso

on both nodes:
zypper in pdsh crmsh pacemaker corosync libcsync-plugin-sftp drbd-utils

## setup cluster

setup vm hostname.
node1: hostnamectl set-hostname tw25-1
node2: hostnamectl set-hostname tw25-2

edit "/etc/hosts", add 2-nodes ip and hostname in it:
192.168.122.175 tw25-1
192.168.122.214 tw25-2

cleanup disk:
wipefs -a /dev/sdb  /dev/vdb
(sdb is 100MB shared disk for sbd, vdb is 1GB disk for drbd.)

on node1:
crm cluster init -s <sbd dev> -y

from my env: crm cluster init -s /dev/sda -y

on node2:
crm cluster join -c <node1-ip>

from my env: crm cluster join -c 192.168.122.175

use "crm status full" to check cluster status.

ref: https://documentation.suse.com/sle-ha/15-SP6/html/SLE-HA-all/article-installation.html

## setup drbd

on both node, create "/etc/drbd.d/drbd_passive.res"

```
resource drbd_passive {
   protocol  C;
   device    /dev/drbd_passive minor 0;
   meta-disk internal;

   on tw25-1 {
     address 192.168.122.134:7788;
     disk    "/dev/disk/by-path/virtio-pci-0000:0b:00.0";
     node-id 0;
   }

   on tw25-2 {
     address 192.168.122.177:7788;
     disk    "/dev/disk/by-path/virtio-pci-0000:0b:00.0";
     node-id 1;
   }

   disk {
     resync-rate 10M;
     no-md-flushes;
     no-disk-flushes;
     no-disk-barrier;
   }

   connection-mesh {
     hosts tw25-1 tw25-2;
   }
}
```

- Run in both nodes: wipefs -a /dev/<drbd-dev>
- Run in both nodes: `drbdadm create-md drbd_passive`
- Run in both nodes: `drbdadm up drbd_passive`
- Run in node 1: `drbdadm -- --overwrite-data-of-peer --force primary drbd_passive`
- Run in both nodes: `drbdadm status drbd_passive`. Continue running this command in both nodes until the devices are in sync.
- Run in node 1: `drbdadm secondary drbd_passive`
- Run in both nodes: `drbdadm down drbd_passive`

please note, after `drbdadm down drbd_passive`, drbdadm left a lock file in
"/var/run/drbd/lock/". This is the key to reproduce this bug. if you remove
the lock file, the issue will never be triggered.

## create/start the drbd resource

on node1:
> # crm config edit

add following config:
```
primitive drbd_passive ocf:linbit:drbd \
          params drbd_resource=drbd_passive ignore_missing_notifications=true
clone ms_drbd_passive drbd_passive \
          meta clone-max=2 clone-node-max=1 notify=true promotable=true
```

the journal log output:
```
drbd(drbd_passive)[4860]: ERROR: drbd_passive: Called drbdadm -c /etc/drbd.conf check-resize drbd_passive
drbd(drbd_passive)[4864]: ERROR: drbd_passive: Exit code 20
drbd(drbd_passive)[4868]: ERROR: drbd_passive: Command output:
drbd(drbd_passive)[4872]: ERROR: drbd_passive: Command stderr: open(/var/run/drbd/lock/drbd-147-0): Permission denied
                  Maybe 'rm -f Maybe 'rm -f /drbd/lock/drbd-147-0): Permission denied
                  ', or check sysctl fs.protected_regular
                  Command 'drbdmeta 0 v09 /dev/disk/by-path/virtio-pci-0000:06:00.0 internal check-resize' terminated with exit code 20
```

you can re-trigger this issue by
```
# crm resource stop ms_drbd_passive
# crm resource stop drbd_passive
# crm resource cleanup drbd_passive
# crm resource cleanup ms_drbd_passive
# crm resource start drbd_passive  <== failure, block next command
# crm resource start ms_drbd_passive <== failure
```

## softwares version

```
# rpm -qa | grep pacemaker
pacemaker-schemas-3.0.0+20250331.008a7d1784-1.1.noarch
pacemaker-libs-3.0.0+20250331.008a7d1784-1.1.x86_64
pacemaker-cli-3.0.0+20250331.008a7d1784-1.1.x86_64
pacemaker-3.0.0+20250331.008a7d1784-1.1.x86_64

# rpm -qa | grep corosync
corosync-libs-3.1.9-2.1.x86_64
corosync-3.1.9-2.1.x86_64

# rpm -qa | grep crmsh
crmsh-scripts-5.0.0+20250522.ffecd6cb-1.1.noarch
crmsh-5.0.0+20250522.ffecd6cb-1.1.noarch

# rpm -qa | grep drbd
drbd-selinux-9.29.0-3.1.x86_64
drbd-utils-9.29.0-3.1.x86_64
drbd-9.1.23-4.4.x86_64
drbd-kmp-default-9.1.23_k6.14.6_1-4.4.x86_64

# uname -a
Linux tw25-3 6.14.6-1-default #1 SMP PREEMPT_DYNAMIC Tue May 13 09:56:22 UTC 2025 (ad69173) x86_64 x86_64 x86_64 GNU/Linux
```

Thanks,
Heming
