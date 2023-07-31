Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A976937C
	for <lists+drbd-dev@lfdr.de>; Mon, 31 Jul 2023 12:50:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C7B00420AFD;
	Mon, 31 Jul 2023 12:50:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F19B420202
	for <drbd-dev@lists.linbit.com>; Mon, 31 Jul 2023 12:50:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED50E22197;
	Mon, 31 Jul 2023 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1690800635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=PJDu3H9G0xjlLFp1Wxvq9yQHkB2Q9jBIbPsGkP5jLhY=;
	b=LfsIvVgX25rf01P6sVcmZRL3nPMT3sPJRPMrpOspwMqpMg9mmQx6AkDi/eF6WU32a2Vp6x
	/7YLD1OJK0u+bqfGa4P87gaOpA6/QZlHA1eZkenSQs1V9CjuRPICqxTQ9KdHYFZ84hOqsV
	4L46K3Rf4+bEtg2brIa/aboXrQrqviE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1690800635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=PJDu3H9G0xjlLFp1Wxvq9yQHkB2Q9jBIbPsGkP5jLhY=;
	b=X5g/KyOpcE2CiMGegP9N6Ypxz5sWUyAuayNnMILk5q3XabEg0BuGZ7c8jHqKycooaqKD7s
	Ajq9KEorZZBfWcDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6932133F7;
	Mon, 31 Jul 2023 10:50:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id ovhUNPqRx2R2ZgAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 31 Jul 2023 10:50:34 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 457F5A0767; Mon, 31 Jul 2023 12:50:34 +0200 (CEST)
Date: Mon, 31 Jul 2023 12:50:34 +0200
From: Jan Kara <jack@suse.cz>
To: Haris Iqbal <haris.iqbal@ionos.com>
Message-ID: <20230731105034.43skhi5ubze563c3@quack3>
References: <20230629165206.383-1-jack@suse.cz>
	<20230704122224.16257-1-jack@suse.cz>
	<ZKbgAG5OoHVyUKOG@infradead.org>
	<CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-nvme@lists.infradead.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jack Wang <jinpu.wang@ionos.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Christoph Hellwig <hch@infradead.org>,
	xen-devel@lists.xenproject.org, Gao Xiang <xiang@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
	Mike Snitzer <snitzer@kernel.org>, Chao Yu <chao@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	Ted Tso <tytso@mit.edu>, linux-mm@kvack.org, Song Liu <song@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, Anna Schumaker <anna@kernel.org>,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 01/32] block: Provide blkdev_get_handle_*
	functions
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gV2VkIDEyLTA3LTIzIDE4OjA2OjM1LCBIYXJpcyBJcWJhbCB3cm90ZToKPiBPbiBUaHUsIEp1
bCA2LCAyMDIzIGF0IDU6MzjigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVsIDA0LCAyMDIzIGF0IDAyOjIxOjI4UE0gKzAy
MDAsIEphbiBLYXJhIHdyb3RlOgo+ID4gPiBDcmVhdGUgc3RydWN0IGJkZXZfaGFuZGxlIHRoYXQg
Y29udGFpbnMgYWxsIHBhcmFtZXRlcnMgdGhhdCBuZWVkIHRvIGJlCj4gPiA+IHBhc3NlZCB0byBi
bGtkZXZfcHV0KCkgYW5kIHByb3ZpZGUgYmxrZGV2X2dldF9oYW5kbGVfKiBmdW5jdGlvbnMgdGhh
dAo+ID4gPiByZXR1cm4gdGhpcyBzdHJ1Y3R1cmUgaW5zdGVhZCBvZiBwbGFpbiBiZGV2IHBvaW50
ZXIuIFRoaXMgd2lsbAo+ID4gPiBldmVudHVhbGx5IGFsbG93IHVzIHRvIHBhc3Mgb25lIG1vcmUg
YXJndW1lbnQgdG8gYmxrZGV2X3B1dCgpIHdpdGhvdXQKPiA+ID4gdG9vIG11Y2ggaGFzc2xlLgo+
ID4KPiA+IENhbiB3ZSB1c2UgdGhlIG9wcG9ydHVuaXR5IHRvIGNvbWUgdXAgd2l0aCBiZXR0ZXIg
bmFtZXM/ICBibGtkZXZfZ2V0XyoKPiA+IHdhcyBhbHdheXMgYSByYXRoZXIgaG9ycmlibGUgbmFt
aW5nIGNvbnZlbnRpb24gZm9yIHNvbWV0aGluZyB0aGF0Cj4gPiBlbmRzIHVwIGNhbGxpbmcgaW50
byAtPm9wZW4uCj4gPgo+ID4gV2hhdCBhYm91dDoKPiA+Cj4gPiBzdHJ1Y3QgYmRldl9oYW5kbGUg
KmJkZXZfb3Blbl9ieV9kZXYoZGV2X3QgZGV2LCBibGtfbW9kZV90IG1vZGUsIHZvaWQgKmhvbGRl
ciwKPiA+ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgYmxrX2hvbGRlcl9vcHMgKmhvcHMp
Owo+ID4gc3RydWN0IGJkZXZfaGFuZGxlICpiZGV2X29wZW5fYnlfcGF0aChkZXZfdCBkZXYsIGJs
a19tb2RlX3QgbW9kZSwKPiA+ICAgICAgICAgICAgICAgICB2b2lkICpob2xkZXIsIGNvbnN0IHN0
cnVjdCBibGtfaG9sZGVyX29wcyAqaG9wcyk7Cj4gPiB2b2lkIGJkZXZfcmVsZWFzZShzdHJ1Y3Qg
YmRldl9oYW5kbGUgKmhhbmRsZSk7Cj4gCj4gKzEgdG8gdGhpcy4KPiBBbHNvLCBpZiB3ZSBhcmUg
cmVtb3ZpbmcgImhhbmRsZSIgZnJvbSB0aGUgZnVuY3Rpb24sIHNob3VsZCB0aGUgbmFtZQo+IG9m
IHRoZSBzdHJ1Y3R1cmUgaXQgcmV0dXJucyBhbHNvIGNoYW5nZT8gV291bGQgc29tZXRoaW5nIGxp
a2UgYmRldl9jdHgKPiBiZSBiZXR0ZXI/CgpJIHRoaW5rIHRoZSBiZGV2X2hhbmRsZSBuYW1lIGlz
IGZpbmUgZm9yIHRoZSBzdHJ1Y3QuIEFmdGVyIGFsbCBpdCBpcwplcXVpdmFsZW50IG9mIGFuIG9w
ZW4gaGFuZGxlIGZvciB0aGUgYmxvY2sgZGV2aWNlIHNvIElNSE8gYmRldl9oYW5kbGUKY2FwdHVy
ZXMgdGhhdCBiZXR0ZXIgdGhhbiBiZGV2X2N0eC4KCgkJCQkJCQkJSG9uemEKLS0gCkphbiBLYXJh
IDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Ry
YmQtZGV2Cg==
