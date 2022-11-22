Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E463633ED1
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 15:23:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 21C9C4252DC;
	Tue, 22 Nov 2022 15:23:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4BDC14252D7
	for <drbd-dev@lists.linbit.com>; Tue, 22 Nov 2022 15:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669127026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=geVsTAOXAFmfC1p8NU5oUZW9hh2dqn+X7qlWo6CR96Y=;
	b=QD9HNhfwpjcZAyrcVDtGcyvcJC1Jt05Njs2nDDlxTHOvhswfgrgNAdHBiLEZ9+1+paIjfS
	xvMFD3qCbJf6A6xMlIn0VpgRM8BByfNqUyTTD/aKI8613kGDOh1+aFjPHhlm3ubdqQY76a
	4fjNNftK21PKnaEPXhuRK9+8oDaXYTo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
	[66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-583-clNrV_glOTiRpOT7AptSQA-1; Tue, 22 Nov 2022 09:23:45 -0500
X-MC-Unique: clNrV_glOTiRpOT7AptSQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5F22101A52A;
	Tue, 22 Nov 2022 14:23:42 +0000 (UTC)
Received: from [172.16.176.1] (unknown [10.22.50.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E09D61121325;
	Tue, 22 Nov 2022 14:23:33 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Date: Tue, 22 Nov 2022 09:23:29 -0500
Message-ID: <C3E8B434-BAEE-42A8-85AF-3B676C65B2A6@redhat.com>
In-Reply-To: <96114bec-1df7-0dcb-ec99-4f907587658d@linuxfoundation.org>
References: <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	<cover.1669036433.git.bcodding@redhat.com>
	<382872.1669039019@warthog.procyon.org.uk>
	<51B5418D-34FB-4E87-B87A-6C3FCDF8B21C@redhat.com>
	<4585e331-03ad-959f-e715-29af15f63712@linuxfoundation.org>
	<26d98c8f-372b-b9c8-c29f-096cddaff149@linuxfoundation.org>
	<A860595D-5BAB-461B-B449-8975C0424311@redhat.com>
	<96114bec-1df7-0dcb-ec99-4f907587658d@linuxfoundation.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Cc: Latchesar Ionkov <lucho@ionkov.net>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-nvme@lists.infradead.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Eric Dumazet <edumazet@google.com>, linux-nfs@vger.kernel.org,
	Marc Dionne <marc.dionne@auristor.com>,
	Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Mike Christie <michael.christie@oracle.com>,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
	Mark Fasheh <mark@fasheh.com>, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Anna Schumaker <anna@kernel.org>,
	Eric Van Hensbergen <ericvh@gmail.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-block@vger.kernel.org, David Teigland <teigland@redhat.com>,
	Joel Becker <jlbec@evilplan.org>, v9fs-developer@lists.sourceforge.net,
	Keith Busch <kbusch@kernel.org>, ceph-devel@vger.kernel.org,
	Xiubo Li <xiubli@redhat.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Leech <cleech@redhat.com>,
	open-iscsi@googlegroups.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
	Lee Duncan <lduncan@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH v1 2/3] Treewide: Stop corrupting socket's
	task_frag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 21 Nov 2022, at 17:32, Shuah Khan wrote:

> On 11/21/22 15:01, Benjamin Coddington wrote:
>> On 21 Nov 2022, at 16:43, Shuah Khan wrote:
>>
>>> On 11/21/22 14:40, Shuah Khan wrote:
>>>> On 11/21/22 07:34, Benjamin Coddington wrote:
>>>>> On 21 Nov 2022, at 8:56, David Howells wrote:
>>>>>
>>>>>> Benjamin Coddington <bcodding@redhat.com> wrote:
>>>>>>
>>>>>>> Since moving to memalloc_nofs_save/restore, SUNRPC has stopped setting the
>>>>>>> GFP_NOIO flag on sk_allocation which the networking system uses to decide
>>>>>>> when it is safe to use current->task_frag.
>>>>>>
>>>>>> Um, what's task_frag?
>>>>>
>>>>> Its a per-task page_frag used to coalesce small writes for networking -- see:
>>>>>
>>>>> 5640f7685831 net: use a per task frag allocator
>>>>>
>>>>> Ben
>>>>>
>>>>>
>>>>
>>>> I am not seeing this in the mainline. Where can find this commit?
>>>>
>>>
>>> Okay. I see this commit in the mainline. However, I don't see the
>>> sk_use_task_frag in mainline.
>>
>> sk_use_task_frag is in patch 1/3 in this posting.
>>
>> https://lore.kernel.org/netdev/26d98c8f-372b-b9c8-c29f-096cddaff149@linuxfoundation.org/T/#m3271959c4cf8dcff1c0c6ba023b2b3821d9e7e99
>>
>
> Aha. I don't have 1/3 in my Inbox - I think it would make
> sense to cc people on the first patch so we can understand
> the premise for the change.

Yeah, I can do that if it goes to another version, I was just trying to be
considerate of all the noise this sort of posting generates.

Ben

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
