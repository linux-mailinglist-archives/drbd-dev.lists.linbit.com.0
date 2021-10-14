Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 908AD431079
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 08:25:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 498F04203DF;
	Mon, 18 Oct 2021 08:25:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1183 seconds by postgrey-1.31 at mail19;
	Thu, 14 Oct 2021 11:53:00 CEST
Received: from mgw-01.mpynet.fi (mgw-01.mpynet.fi [82.197.21.90])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 45F45420FF2
	for <drbd-dev@lists.linbit.com>; Thu, 14 Oct 2021 11:52:59 +0200 (CEST)
Received: from pps.filterd (mgw-01.mpynet.fi [127.0.0.1])
	by mgw-01.mpynet.fi (8.16.0.43/8.16.0.43) with SMTP id 19E9Pj42091529; 
	Thu, 14 Oct 2021 12:32:59 +0300
Received: from ex13.tuxera.com (ex13.tuxera.com [178.16.184.72])
	by mgw-01.mpynet.fi with ESMTP id 3bphjf80v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 14 Oct 2021 12:32:59 +0300
Received: from tuxera-exch.ad.tuxera.com (10.20.48.11) by
	tuxera-exch.ad.tuxera.com (10.20.48.11) with Microsoft SMTP Server
	(TLS) id 15.0.1497.23; Thu, 14 Oct 2021 12:32:59 +0300
Received: from tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789]) by
	tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789%12]) with mapi id
	15.00.1497.023; Thu, 14 Oct 2021 12:32:59 +0300
From: Anton Altaparmakov <anton@tuxera.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: don't use ->bd_inode to access the block device size
Thread-Index: AQHXv/D8RnQWsWSgAkyxOdAYku+41KvR10wAgAAzeIA=
Date: Thu, 14 Oct 2021 09:32:58 +0000
Message-ID: <3AB8052D-DD45-478B-85F2-BFBEC1C7E9DF@tuxera.com>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211014062844.GA25448@lst.de>
In-Reply-To: <20211014062844.GA25448@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [109.154.241.177]
Content-ID: <F1129580E148624C920474BEC9F515C5@ex13.tuxera.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: itBrsNbhZ2FR6MA_DlXhPV1L0UjW3zcs
X-Proofpoint-GUID: itBrsNbhZ2FR6MA_DlXhPV1L0UjW3zcs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
	definitions=2021-10-14_02:2021-10-14,
	2021-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=mpy_notspam policy=mpy score=0 spamscore=0
	mlxlogscore=453 bulkscore=0
	malwarescore=0 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2109230001 definitions=main-2110140057
X-Mailman-Approved-At: Mon, 18 Oct 2021 08:25:41 +0200
Cc: Dave Kleikamp <shaggy@kernel.org>, "jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>, Mike Snitzer <snitzer@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jens Axboe <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, "linux-ntfs-dev@lists.sourceforge.net"
	<linux-ntfs-dev@lists.sourceforge.net>, Jan Kara <jack@suse.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Drbd-dev] don't use ->bd_inode to access the block device size
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

Hi Christoph,

> On 14 Oct 2021, at 07:28, Christoph Hellwig <hch@lst.de> wrote:
> 
> On Wed, Oct 13, 2021 at 07:10:13AM +0200, Christoph Hellwig wrote:
>> I wondered about adding a helper for looking at the size in byte units
>> to avoid the SECTOR_SHIFT shifts in various places.  But given that
>> I could not come up with a good name and block devices fundamentally
>> work in sector size granularity I decided against that.
> 
> So it seems like the biggest review feedback is that we should have
> such a helper.  I think the bdev_size name is the worst as size does
> not imply a particular unit.  bdev_nr_bytes is a little better but I'm
> not too happy.  Any other suggestions or strong opinions?

bdev_byte_size() would seem to address your concerns?

bdev_nr_bytes() would work though - it is analogous to bdev_nr_sectors() after all.

No strong opinion here but I do agree with you that bdev_size() is a bad choice for sure.  It is bound to cause bugs down the line when people forget what unit it is in.

Best regards,

	Anton
-- 
Anton Altaparmakov <anton at tuxera.com> (replace at with @)
Lead in File System Development, Tuxera Inc., http://www.tuxera.com/
Linux NTFS maintainer

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
