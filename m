Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC363353B
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Nov 2022 07:25:28 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 400BC4252BF;
	Tue, 22 Nov 2022 07:25:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7138B4204B5
	for <drbd-dev@lists.linbit.com>; Mon, 21 Nov 2022 22:43:33 +0100 (CET)
Received: by mail-io1-f45.google.com with SMTP id c7so9598498iof.13
	for <drbd-dev@lists.linbit.com>; Mon, 21 Nov 2022 13:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=ImVe+g+b+10JJjRyFbVg3VQDLgN59Ue/Abv7vaFmseQ=;
	b=OHO4FjaPJmimqdrzS/OkstIvhocxCz1emkoHfOdBnFW624ABdZXIGpUr2qg1Kuoid7
	jQ3zRS/xznKzGtwvpkBw8YcBHanbAjUGKtSMJ92a5WUJdkI77H4tBot4cVhu32vyccdd
	iMTMhCXmKhazzg9UmrMMNr5aOJxLl31QLMnEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=ImVe+g+b+10JJjRyFbVg3VQDLgN59Ue/Abv7vaFmseQ=;
	b=yUKhte77Yk4dqIBs2N1FV0a1paYKd4z516ZHgAqZju4oMEKzmY17BDRcjKI0zygBKH
	oy224MydrDJdvVVqHfkStA5BPvzKm90v+mS3kNmxVwI+5gp+5HNbiXtnq3/ft6PZhrlg
	suajT6xOP3MNUxDUjg+KtXj5SsEC6CmUvBZ9I63uxmeTVkifGuthQAMNqw319tEJ9z7J
	5Ng3IYvjlRkDtJU3BCsoRpzLcO83CIFvuvjdFezwldP4+EApJZ9CO2HelA9ornAJhtgO
	PYTiZkjiBr5VMYFeLlrONy2LNrSWeUl1AEQvXHAEyX2Oxu16h9NlvXPMxnH8qw6nbr3y
	XCWw==
X-Gm-Message-State: ANoB5pmx5OYDd+eV25s2g4gkNyXJDCQNSyp2fP6DqElW2qCv+xu48nif
	qagRz/q0gHBxUD/L+RZspKwBpA==
X-Google-Smtp-Source: AA0mqf7f7poc1w7ewSMxS1++ciq574fA83Q7zTNUSYFoHm3cWPyzQwbrRSPhTjg/tqVe+6wU++ijsA==
X-Received: by 2002:a5d:9c0d:0:b0:6de:e346:27d4 with SMTP id
	13-20020a5d9c0d000000b006dee34627d4mr639526ioe.138.1669067012402;
	Mon, 21 Nov 2022 13:43:32 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
	p5-20020a92c105000000b00302a7165d9bsm3672008ile.53.2022.11.21.13.43.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 21 Nov 2022 13:43:31 -0800 (PST)
Message-ID: <26d98c8f-372b-b9c8-c29f-096cddaff149@linuxfoundation.org>
Date: Mon, 21 Nov 2022 14:43:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.4.2
Content-Language: en-US
To: Benjamin Coddington <bcodding@redhat.com>,
	David Howells <dhowells@redhat.com>
References: <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	<cover.1669036433.git.bcodding@redhat.com>
	<382872.1669039019@warthog.procyon.org.uk>
	<51B5418D-34FB-4E87-B87A-6C3FCDF8B21C@redhat.com>
	<4585e331-03ad-959f-e715-29af15f63712@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <4585e331-03ad-959f-e715-29af15f63712@linuxfoundation.org>
X-Mailman-Approved-At: Tue, 22 Nov 2022 07:25:23 +0100
Cc: Latchesar Ionkov <lucho@ionkov.net>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-nvme@lists.infradead.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 11/21/22 14:40, Shuah Khan wrote:
> On 11/21/22 07:34, Benjamin Coddington wrote:
>> On 21 Nov 2022, at 8:56, David Howells wrote:
>>
>>> Benjamin Coddington <bcodding@redhat.com> wrote:
>>>
>>>> Since moving to memalloc_nofs_save/restore, SUNRPC has stopped setting the
>>>> GFP_NOIO flag on sk_allocation which the networking system uses to decide
>>>> when it is safe to use current->task_frag.
>>>
>>> Um, what's task_frag?
>>
>> Its a per-task page_frag used to coalesce small writes for networking -- see:
>>
>> 5640f7685831 net: use a per task frag allocator
>>
>> Ben
>>
>>
> 
> I am not seeing this in the mainline. Where can find this commit?
> 

Okay. I see this commit in the mainline. However, I don't see the
sk_use_task_frag in mainline.

thanks,
-- Shuah

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
